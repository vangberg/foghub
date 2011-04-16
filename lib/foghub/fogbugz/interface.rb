require_relative './http'

module Fogbugz
  class Interface
    attr_accessor :token

    def initialize(options)
      @adapter = options[:adapter]

      @url, @email, @password = options[:url], options[:email], options[:password]
    end

    def authenticate
      @token ||= request :logon, :email => @email, :password => @password
    end

    def request(cmd, params = {})
      params.merge!({:token => @token}) if @token
      @adapter.request(cmd, params)
    end
  end
end
