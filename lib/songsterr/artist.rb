module Songsterr
  class Artist < Data::Base
    def songs
      @songs ||= Song.where(:artist => info(:name))
    end
  end
end

