# -*- coding: UTF-8 -*-
require 'spec_helper'

describe Connectqq do

  describe ".respond_to?" do
    it "should take an optional argument" do
      Connectqq.respond_to?(:new, true).should be_true
    end
  end

  describe ".new" do
    it "should return a Connectqq::Client" do
      Connectqq.new.should be_a Connectqq::Client
    end
  end

end
