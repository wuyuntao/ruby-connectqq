# -*- coding: UTF-8 -*-

module Connectqq
  class Error < StandardError
    def initialize(data=nil)
      @data = data
      super
    end
  end
end
