require 'restclient'
require 'json'

module Songsterr
  module Request
    class << self

      def get(segments, params={})
        JSON.parse(RestClient.get("http://www.songsterr.com/a/ra/#{segments}.json", params).to_s)
      end

    end
  end
end
