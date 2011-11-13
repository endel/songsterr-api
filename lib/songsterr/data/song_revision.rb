require 'songsterr/data/track'

module Songsterr
  module Data
    class SongRevision < Base

      def tracks
        @tracks ||= info(:tracks).collect {|data| Track.new(data) }
      end

      def most_popular_track
        tracks.select {|track| track.id == info(:most_popular_track)['id'] }.first
      end

      def guitar_pro_tab
        @guitar_pro_url ||= attachment_url(:guitar_pro_tab)
      end

    end
  end
end
