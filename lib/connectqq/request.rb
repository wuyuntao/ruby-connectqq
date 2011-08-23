# -*- coding: UTF-8 -*-
require 'json'

module Connectqq
  module Request
    %w[get post put delete].each do |method|
      define_method method do |uri, options|
        request(method.to_sym, uri, options)
      end
    end

    private

    def request(method, uri, options={})
      options.merge! :format => :json, :openid => @openid
      arguments = parse_uri(method, uri, options)

      # QQ requires including oauth parameters in body when sending a POST request
      consumer_options = [:post, :put].include?(method) ? {:scheme => :body, :http_method => :post} : {}
      response = access_token(consumer_options).send(method, *arguments)

      handle_http_error(response)
      message = JSON.parse(response.body)
      handle_message_error(message)
      message 
    end

    def parse_uri(method, uri, options={})
      headers = options.delete(:headers)
      uri = URI.parse(uri)

      if [:post, :put].include?(method)
        [uri.to_s, options, headers]
      else
        uri.query = to_query(options)
        [uri.to_s, headers]
      end
    end

    def to_query(hash={})
      hash.keys.inject([]) do |query, key|
        query << "#{URI.encode(key.to_s)}=#{URI.encode(hash[key].to_s)}"
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
