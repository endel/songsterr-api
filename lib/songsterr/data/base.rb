module Songsterr
  module Data
    class Base
      attr_reader :data

      def initialize(data)
        @data = data
      end

      def inspect
        "<#{self.class.name}:#{self.object_id}>"
      end

      protected
        def info(key)
          @data[key.to_s.camelize(:lower)]
        end

        def method_missing(method, *args, &block)
          info(method) or raise NoMethodError, "Method or attribute '#{method}' not exists on #{self.class.name}."
        end

        def attachment_url(key)
          info(key)['attachmentUrl']
        end
    end
  end
end


