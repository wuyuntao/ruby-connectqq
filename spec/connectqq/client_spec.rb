# -*- coding: UTF-8 -*-
require 'spec_helper'

describe Connectqq::Client do

  describe ".get_user_info" do
    before(:each) do
      stub_request(:get, /^http:\/\/openapi\.qzone\.qq\.com\/user\/get_user_info/)
        .to_return(:status  => 200,
                   :body    => fixture('user.json'),
                   :headers => {:content_type => "text/html; charset=utf-8"})
    end

    it "should return user info " do
      client = Connectqq::Client.new tokens
      msg = client.get_user_info
      msg.ret.should == 0
      msg.msg.should == ""
      msg.nickname.should == "wuyuntao"
      msg.figureurl.should == "http://qzapp.qlogo.cn/qzapp/218869/8F966AC8FB09140015F6DB0758B844B2/30"
    end
  end

  describe ".add_share" do
    before(:each) do
      stub_request(:post, "http://openapi.qzone.qq.com/share/add_share")
        .to_return(:status  => 200,
                   :body    => fixture('post_message.json'),
                   :headers => {:content_type => "text/html; charset=utf-8"})
    end

    it "should add status to user's qzone" do
      client = Connectqq::Client.new tokens
      msg = client.add_share :title   => "测试标题",
                             :url     => "http://apk.zuikong.com/",
                             :comment => "测试评论",
                             :summary => "测试网址摘要",
                             :source  => 3
        
      msg.ret.should == 0
      msg.msg.should == ""
    end
  end

  describe ".list_album" do
  end

  describe ".upload_pic" do
  end

  describe ".add_album" do
  end

  describe ".add_one_blog" do
  end

  describe ".add_topic" do
  end

end
