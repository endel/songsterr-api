require 'songsterr/data/instrument'
require 'songsterr/data/track_audio'
require 'songsterr/data/track_layout_image'

module Songsterr
  module Data
    class Track < Base

      def has_lyrics?
        info(:with_lyrics)
      end

      def instrument
        @instrument ||= Instrument.new(info(:instrument))
      end

      def audios
        @audios ||= info(:track_audios).collect {|data| TrackAudio.new(data) }
      end

      def layout_images
        @layout_images ||= info(:track_layout_images).collect {|data| TrackLayoutImage.new(data) }
      end

    end
  end
end

