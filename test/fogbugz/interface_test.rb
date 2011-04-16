require_relative '../test_helper'
require 'foghub/fogbugz/fogbugz'

class FogbugzTest < MiniTest::Unit::TestCase
  def setup
    @adapter = mock()

    @credentials = {
      :url => 'http://firmafon.dk',
      :email => 'sirup@sirupsen.com',
      :password => 'seekrit',
      :adapter => @adapter
    }

    @interface = Fogbugz::Interface.new(@credentials)
  end

  test 'requests for token when authenticating' do
    @adapter.expects(:request).with(:logon, 
                                    :email => @credentials[:email],
                                    :password => @credentials[:password])
    @interface.authenticate 
  end

  test 'custom token request' do
    cmd = 'test'
    token = 'seekrit'

    @adapter.expects(:request).with(cmd, :extra => 'param', :token => token)

    @interface.token = 'seekrit'
    @interface.request(cmd, :extra => 'param')
  end
end
