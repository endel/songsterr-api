require 'songsterr/data/base'
require 'songsterr/data/song_revision'

#
# Songsterr Module that wraps public Songsterr API
#
module Songsterr
  class Song < Data::Base
    #
    # Class Methods
    #
    class << self
      # Get Song by id
      # @return [Song]
      def find(id)
        self.new(Request.get("player/song/#{id}"))
      end

      # Filter song by the given params.
      #
      # @param [Hash] params
      #
      # @option [Integer] :id
      # @option [String] :artist
      # @option [Array] :artists
      # @option [String] :pattern (artist and/or song)
      # @option [Regexp] :title filter by title
      #
      # @example finding by id
      #   Songsterr::Song.where(:id => 23847)
      # @example finding by artist
      #   Songsterr::Song.where(:artist => "Black Sabbath")
      # @example finding by artists
      #   Songsterr::Song.where(:artists => ["Black Sabbath", "Metallica"])
      # @example finding by pattern (artist and/or song)
      #   Songsterr::Song.where(:pattern => "Dragon")
      # @example filtering by title (artist and/or song)
      #   Songsterr::Song.where(:artist => "Metallica", :title => /war/)
      #
      # @return [Array] list of Song instances
      def where(data={})
        if data[:id]
          return self.find(data[:id])

        elsif (artists = (data[:artist] || data[:artists]))
          artists = [artists] unless artists.kind_of? Array
          artists.collect!{|a| "\"#{a}\"" }
          songs = Request.get('songs/byartists', :artists => artists.join(','))

        elsif data[:pattern]
          songs = Request.get('songs', :pattern => data[:pattern])
        end

        songs = songs.collect {|s| self.new(s) }
        songs.select! {|s| s.title =~ data[:title] } if data[:title]
        songs
      end
    end

    # Get Song artist.
    # @return [Artist]
    def artist
      @artist ||= Artist.new(info(:artist))
    end

    # Get last avaible revision from this Song.
    # @return [SongRevision]
    def revision
      @revision ||= begin
                      unless info(:latest_available_revision)
                        self.class.find(info(:id)).revision
                      else
                        Data::SongRevision.new(info(:latest_available_revision))
                      end
                    end
    end


  end
end
