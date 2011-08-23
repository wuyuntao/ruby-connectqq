# -*- coding: UTF-8 -*-
require 'oauth'

module Connectqq
  module Authentication

    @@consumer_options = {
      :scheme             => :query_string,
      :signature_method   => "HMAC-SHA1",
      :site               => "http://openapi.qzone.qq.com",
      :authorize_path     => "/oauth/qzoneoauth_authorize",
      :request_token_path => "/oauth/qzoneoauth_request_token",
      :access_token_path  => "/oauth/qzoneoauth_access_token",
      :http_method        => :get,
    }

    # Add access token
    #
    # @return [OAuth::]
    def authenticate(options={})
      @access_token = options[:access_token]
      @access_token_secret = options[:access_token_secret]
      @openid = options[:openid]
    end

    # Check whether user is authenticated
    #
    # @return [Boolean]
    def authenticated?
      not @access_token.nil?
    end

    # Get request token
    #
    # @param oauth_callback [String]
    #
    # @return [OAuth::RequestToken]
    def get_request_token(options={})
      @request_token = consumer.get_request_token(options)
    end

    # Get authorize URL
    #
    # @param oauth_callback [String]
    #
    # @return [String]
    def get_authorize_url(options={})
      @request_token ||= get_request_token(callback_url, consumer)
      request_token.authorize_url(options)
    end

    # Get access token
    # 
    # @return [OAuth::AccessToken]
    def get_access_token(request_token, request_token_secret, options={})
      request_token = OAuth::RequestToken.new(consumer, request_token, request_token_secret)
      request_token.get_access_token(options)
    end

    def consumer(options={})
      options = @@consumer_options.merge(options)
      OAuth::Consumer.new(@consumer_key, @consumer_secret, options)
    end

    def access_token(options={})
      OAuth::AccessToken.new(consumer(options), @access_token, @access_token_secret)
    end

  end
end
