# -*- coding: UTF-8 -*-
require 'connectqq'
require 'rspec'
require 'webmock/rspec'

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def tokens
  {
    :consumer_key         => 'ck1',
    :consumer_secret      => 'cs1',
    :access_token         => 'at1',
    :access_token_secret  => 'ats1',
    :openid               => 'oid1',
  }
end

