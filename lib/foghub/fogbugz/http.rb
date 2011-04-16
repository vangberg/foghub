require 'cgi'
require 'typhoeus'
require 'crack/xml'

module Fogbugz
  class Request
    def request(cmd, params)
      params.merge!({:cmd => cmd}) && @token && params.merge!({:token => @token})
      raise StandardError, "Token or credentials not set" unless 

      parse Typhoeus::Request.get(request_url(params))
    end

    def parse(response)
      Crack::XML.parse(response.body)['response']
    end

    def request_url(params)
      "#{@url}/#{escape_params(params)}"
    end

    def escape_params(params)
      params.collect { |key, val| "#{CGI::escape(key.to_s)}=#{CGI::escape(val.to_s)}" }.join('&') unless params.nil?
    end
  end
end
