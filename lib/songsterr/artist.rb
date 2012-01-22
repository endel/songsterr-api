module Songsterr
  class Artist < Data::Base

    # Get name
    # @return [String]
    def name
      info(:name)
    end

    # Get if name use prefix.
    # @return [Boolean]
    def has_prefix?
      info(:use_the_prefix)
    end

    # Get name without the prefix
    # @return [String]
    def name_without_prefix
      info(:name_without_the_prefix)
    end

    # Get all songs from this Artist
    # @return [Array] array with Song instances.
    def songs
      @songs ||= Song.where(:artist => info(:name))
    end
  end
end

