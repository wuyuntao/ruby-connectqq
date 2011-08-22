# -*- coding: UTF-8 -*-

module Connectqq
  module Authentication

    # Add access token
    #
    # @return [Hash]
    def authenticate(options={})
      @access_token = options[:access_token]
      @access_token_secret = options[:access_token_secret]
      {
        :access_token => @access_token,
        :access_token_secret => @access_token_secret,
      }
    end

    # Check whether user is authenticated
    #
    # @return [Boolean]
    def authenticated?
      not @access_token.nil? and not @access_token_secret.nil?
    end

    # Get request token
    #
    # @return [OAuthToken]
    def get_request_token
    end

    # Get authorize URL
    #
    # @return [String]
    def get_authorize_url
    end

    # Get access token
    # 
    # @return [OAuthToken]
    def get_access_token
    end

  end
end
