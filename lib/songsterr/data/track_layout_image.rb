module Songsterr
  module Data
    class TrackLayoutImage < Base

      # Get remote image url
      # @return [String]
      def image
        attachment_url(:image)
      end

      # Get remote timeline map
      # @return [String]
      def timeline_map
        attachment_url(:timeline_map)
      end

    end
  end
end
