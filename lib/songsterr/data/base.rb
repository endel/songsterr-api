module Songsterr
  module Data
    class Base
      attr_reader :data

      def initialize(data)
        @data = data
      end

      def info(key)
        @data[key.to_s.camelize(:lower)]
      end

      def method_missing(method, *args, &block)
        info(method) or raise NoMethodError, "Method or attribute '#{method}' not exists on #{self.class.name}."
      end

      protected
        def attachment_url(key)
          info(key)['attachmentUrl']
        end
    end
  end
end


