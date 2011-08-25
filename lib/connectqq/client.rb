# -*- coding: UTF-8 -*-

require 'ostruct'
require 'connectqq/request'
require 'connectqq/authentication'

module Connectqq
  class Client
    include Request
    include Authentication

    def initialize(options={})
      @consumer_key = options[:consumer_key]
      @consumer_secret = options[:consumer_secret]

      authenticate(options)
    end

    # 获取用户信息，目前可获取用户昵称及头像信息。
    #
    # @return [Hash]
    def get_user_info(options={})
      get("/user/get_user_info", options)
    end

    # 发布动态
    #
    # @param title [String]     feeds的标题。最长36个中文字，超出部分会被截断。
    # @param url [String]       分享所在网页资源的链接，点击后跳转至第三方网页。请以http://开头。
    # @param comment [String]   用户评论内容，也叫发表分享时的分享理由
    #                           禁止使用系统生产的语句进行代替
    #                           最长40个中文字，超出部分会被截断。
    # @param summary [String]   所分享的网页资源的摘要内容，或者是网页的概要描述
    #                           最长80个中文字，超出部分会被截断。
    # @param images [String]    所分享的网页资源的代表性图片链接"
    #                           请以http://开头，长度限制255字符。
    #                           多张图片以竖线（|）分隔，目前只有第一张图片有效
    #                           图片规格100*100为佳。
    # @param source [String]    分享的场景 取值说明：
    #                           1.通过网页 2.通过手机 3.通过软件 4.通过IPHONE 5.通过 IPAD。
    # @param type [String]      分享内容的类型。
    # @param playurl [String]   长度限制为256字节。仅在type=5的时候有效。
    #
    # @return [Hash]
    def add_share(options={})
      post("/share/add_share", options)
    end

    # 获取的相册列表
    #
    #
    # @return [Hash]
    def list_album(options={})
      get("/photo/list_album", options)
    end

    # 上传照片
    #
    # @param photodesc [String] 照片描述，注意照片描述不能超过200个字符。
    # @param title [String]     照片的命名，必须以.jpg, .gif, .png, .jpeg, .bmp此类后缀结尾。
    # @param albumid [String]   相册id，不填则传到默认相册
    # @param x [String]         照片拍摄时的地理位置的经度。请使用原始数据（纯经纬度，0-360）。
    # @param y [String]         照片拍摄时的地理位置的纬度。请使用原始数据（纯经纬度，0-360）。
    # @param picture [String]   上传照片的文件名以及图片的内容
    #                           在发送请求时，图片内容以二进制数据流的形式发送
    #                           注意照片名称不能超过30个字符。
    #
    # @return [Hash]
    def upload_pic(options={})
      post("/photo/upload_pic", options)
    end

    # 创建相册
    #
    # @param albumname [String] 相册名，不能超过30个字符。 
    # @param albumdesc [String] 相册描述，不能超过200个字符。
    # @param priv [String]      相册权限，其取值含义为：
    #                           1=公开；3=只主人可见； 4=QQ好友可见； 5=问答加密。
    #                           不传则相册默认为公开权限。
    #                           如果priv取值为5，即相册是问答加密的，则必须包含问题和答案两个参数：
    # @param question [String]  问题，不能超过30个字符。 
    # @param answer [String]    答案，不能超过30个字符。 
    #
    # @return [Hash]
    def add_album(options={})
      post("/photo/add_album", options)
    end

    # 发表一篇新日志
    #
    # @param title [String]     日志标题（纯文本，最大长度128个字节，utf-8编码）。 
    # @param content [String]   文章内容（html数据，最大长度100*1024个字节，utf-8编码）.
    #
    # @return [Hash]
    def add_one_blog(options={})
      post("/blog/add_one_blog", options)
    end

    # 发布心情
    #
    # @param richtype [String]  发布心情时引用的信息的类型。
    #                           1表示图片； 2表示网页； 3表示视频。 
    # @param richval [String]   发布心情时引用的信息的值。有richtype时必须有richval 
    # @param con [String]       发布的心情的内容。
    # @param lbs_nm [String]    地址文。例如：广东省深圳市南山区高新科技园腾讯大厦。lbs_nm，lbs_x，lbs_y通常一起使用，来明确标识一个地址。 
    # @param lbs_x [String]     经度。请使用原始数据（纯经纬度，0-360）
    # @param lbs_y [String]     纬度。请使用原始数据（纯经纬度，0-360）
    # @param lbs_id [String]    地点ID
    # @param lbs_idnm [String]  地点名称
    #
    # @return [Hash]
    def add_topic(options={})
      post("/shuoshuo/add_topic", options)
    end

  end
end
