module Songsterr
  module Data
    class TrackAudio < Base

      # Get TrackAudio id.
      # @return [Integer]
      def id
        info(:id)
      end

      # Get remote mp3 file url from this track.
      # @return [String]
      def mp3_file
        attachment_url(:mp3_file)
      end

      # Get speed of this track. 100 = normal speed. 50 = half speed.
      # @return [Integer] 100 or 50
      def speed
        info(:speed)
      end

    end
  end
end


