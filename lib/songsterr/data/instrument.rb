module Songsterr
  module Data
    class Instrument < Base

      # Get name
      # @return [String]
      def name
        info(:name)
      end

      # Get volume
      # @return [Integer]
      def volume
        info(:value)
      end

    end
  end
end

