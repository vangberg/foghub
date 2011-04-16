require_relative './interface'
require_relative './http'

module Fogbugz
  class << self
    attr_accessor :adapter
  end

  self.adapter = Request
end

