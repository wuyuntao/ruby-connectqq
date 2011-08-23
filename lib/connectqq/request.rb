# -*- coding: UTF-8 -*-

module Connectqq
  module Request
    %w[get post put delete].each do |method|
      define_method method do |uri, options|
        request(method.to_sym, uri, options)
      end
    end

    private

    def request(method, uri, options={})
      arguments = parse_uri(method, uri, options)
      response = @access_token.send(method, *arguments)
      handle_http_error(response)
      message = JSON.parse(response.body)
      handle_message_error(message)
      message 
    end

    def parse_uri(method, uri, options={})
      headers = options.delete(:headers)
      body = options.delete(:body)
      uri = URI.parse(uri)
      uri.query = to_query(options)

      if [:post, :put].include?(method)
        [uri.to_s, body, headers]
      else
        [uri.to_s, headers]
      end
    end

    def to_query(hash)
      hash.keys.inject([]) do |query, key|
        query << "#{URI.encode(key.to_s)}=#{URI.encode(hash[key])}"
      end * '&'
    end

    def handle_http_error(response)
      if response.code.to_i != 200
        data = JSON.parse(response.body)
        raise Error.new(data)
      end
    end

    def handle_message_error(message)
      if message["ret"] != 0
        raise Error.new(message)
      end
    end

  end
end
