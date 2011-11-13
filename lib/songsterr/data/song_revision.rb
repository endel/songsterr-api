require 'songsterr/data/track'

module Songsterr
  module Data
    class SongRevision < Base

      def most_popular_track
        tracks.select {|track| track.id == info(:most_popular_track)['id'] }.first
      end

      def tracks
        @tracks ||= info(:tracks).collect {|data| Track.new(data) }
      end

      def guitar_pro_tab
        @guitar_pro_url ||= info(:guitar_pro_tab)['attachmentUrl']
      end

    end
  end
end
