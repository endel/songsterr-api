module Songsterr
  module Data
    class TrackLayoutImage < Base

      def image
        attachment_url(:image)
      end

      def timeline_map
        attachment_url(:timeline_map)
      end

    end
  end
end



