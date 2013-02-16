# encoding: UTF-8

require 'test_helper'

class SmsGateway::Adapters::SmsGatewayTest < Test::Unit::TestCase
  include SmsGateway

  def setup
  end

  def test_sms_gateway

    SmsGateway::Base.config = { 
      :from => '493011111111',
      :user => 'userid',
      :password => 'secret',
      :adapter => 'sms_global'
    }

    stub_request(:post, "http://www.smsglobal.com/http-api.php?action=sendsms&from=493011111111&password=secret&text=hello&to=493088888888&user=userid").
      to_return(:status => 200, :body => "OK: 0;", :headers => {})

    sms = Sms.new(:to => '493088888888',
                  :text => "hello")

    sms.deliver

    assert_requested(:post, "http://www.smsglobal.com/http-api.php?action=sendsms&from=493011111111&password=secret&text=hello&to=493088888888&user=userid")
  end


  def test_sms_trade

    SmsGateway::Base.config = {
      :adapter => 'sms_trade',
      :route => 'direct',
      :key => 'KEY',
      :from => 'SMSTRADE'
    }

    sms = Sms.new(:to => '491701234567', :text => "Hallö Ümläut.")

    stub_request(:get, "http://gateway.smstrade.de/?charset=UTF-8&from=SMSTRADE&key=KEY&message=#{URI.encode(sms.text)}&route=direct&to=491701234567").
        to_return(:status => 200, :body => "", :headers => {})

    sms.deliver

    assert_requested(:get, "http://gateway.smstrade.de/?key=KEY&to=491701234567&message=#{URI.encode(sms.text)}&route=direct&from=SMSTRADE&charset=UTF-8")
  end



end




