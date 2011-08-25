# -*- coding: UTF-8 -*-
require 'spec_helper'

describe Connectqq::Authentication do

  describe ".get_request_token" do
    it "should return request token" do
      client = Connectqq::Client.new tokens
      token = client.get_request_token
    end
  end
end
