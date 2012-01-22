require 'songsterr/data/instrument'
require 'songsterr/data/track_audio'
require 'songsterr/data/track_layout_image'

module Songsterr
  module Data
    class Track < Base

      # Get track title.
      # @return [String]
      def title
        info(:title)
      end

      # Get track tuning.
      # @return [String] sample -> "64-59-55-50-45-40"
      def tuning
        info(:tuning)
      end

      # Check if this song has embedded lyrics. 
      # @return [Boolean]
      def has_lyrics?
        info(:with_lyrics)
      end

      # Get instrument data from this track.
      # @return [Instrument]
      def instrument
        @instrument ||= Instrument.new(info(:instrument))
      end

      # Get TrackAudio instance of this Track.
      # @return [TrackAudio]
      def audio(speed=100)
        @audios ||= info(:track_audios).collect {|data| TrackAudio.new(data) }
        @audios.select {|audio| audio.speed == speed }.first
      end

      # Get layout image data.
      # @return [Array] an array of TrackLayoutImage instances.
      def layout_images
        @layout_images ||= info(:track_layout_images).collect {|data| TrackLayoutImage.new(data) }
      end

    end
  end
end

