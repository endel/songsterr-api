require 'restclient'
require 'json'

module Songsterr
  class Request
    class << self

      # Send a GET request to Songsterr API and parse it's JSON response.
      #
      # @param [String] segments
      # @param [Hash] parameters
      #
      # @return [Object]
      def get(segments, params={})
        JSON.parse(RestClient.get("http://www.songsterr.com/a/ra/#{segments}.json", params).to_s)
      end

    end
  end
end
