require 'songsterr/data/track'

module Songsterr
  module Data
    class SongRevision < Base

      # Get all tracks avaible
      # @return [Array] array of Track instances
      def tracks
        @tracks ||= info(:tracks).collect {|data| Track.new(data) }
      end

      # Get most popular track avaible
      # @return [Track] most popular track
      def most_popular_track
        tracks.select {|track| track.id == info(:most_popular_track)['id'] }.first
      end

      # Get the Guitar Pro file from the entire song.
      # @return String
      def guitar_pro_tab
        @guitar_pro_url ||= attachment_url(:guitar_pro_tab)
      end

    end
  end
end
