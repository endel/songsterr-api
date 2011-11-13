require 'songsterr/data/base'
require 'songsterr/data/song_revision'

module Songsterr
  class Song < Data::Base
    #
    # Class Methods
    #
    class << self
      def find_by_id(id)
        self.new(Request.get("player/song/#{id}"))
      end

      def where(data={})
        if data[:id]
          return self.find_by_id(data[:id])

        elsif (artists = (data[:artist] || data[:artists]))
          artists = [artists] unless artists.kind_of? Array
          artists.collect!{|a| "\"#{a}\"" }
          songs = Request.get('songs/byartists', :artists => artists.join(','))

        elsif data[:pattern]
          songs = Request.get('songs', :pattern => data[:pattern])
        end

        songs.collect {|data| self.new(data) }
      end
    end

    #
    # Instance Methods
    #
    def artist
      @artist ||= Artist.new(info(:artist))
    end

    def revision
      @revision ||= begin
                      unless info(:latest_available_revision)
                        self.class.find_by_id(info(:id)).revision
                      else
                        Data::SongRevision.new(info(:latest_available_revision))
                      end
                    end
    end

  end
end
