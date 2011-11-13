module Songsterr
  module Data
    class TrackAudio < Base

      def mp3_file
        attachment_url(:mp3_file)
      end

    end
  end
end


