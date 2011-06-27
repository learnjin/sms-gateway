
require 'test_helper'

class SmsGateway::Adapters::SmsGatewayTest < Test::Unit::TestCase
  include SmsGateway

  def setup

    SmsGateway::Base.configure do |config|
      config.from = '493011111111'
      config.user = 'userid'
      config.password = 'secret'
      config.adapter = 'sms_global'
    end

  end

  def test_outgoing_request

    stub_request(:post, "http://www.smsglobal.com/http-api.php?action=sendsms&from=493011111111&password=secret&text=hello&to=493088888888&user=userid").
      to_return(:status => 200, :body => "OK: 0;", :headers => {})

    sms = Sms.new(:to => '493088888888',
                  :text => "hello")

    sms.deliver

    assert_requested(:post, "http://www.smsglobal.com/http-api.php?action=sendsms&from=493011111111&password=secret&text=hello&to=493088888888&user=userid")
  end

end




