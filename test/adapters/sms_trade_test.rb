require 'test_helper'

describe SmsGateway::Adapters::SmsGlobal do

  before do
    SmsGateway::Base.config = {
      :adapter => 'sms_trade',
      :route => 'direct',
      :key => 'KEY',
      :from => 'SMSTRADE'
    }
  end

  it 'works with smstrade' do

    sms = SmsGateway::Sms.new(:to => '491701234567', :text => "Hallö Ümläut.", :from => 'SENDER')

    stub_request(:get, "http://gateway.smstrade.de/?charset=UTF-8&from=SENDER&key=KEY&message=#{URI.encode(sms.text)}&route=direct&to=491701234567").
        to_return(:status => 200, :body => "", :headers => {})

    sms.deliver

    assert_requested(:get, "http://gateway.smstrade.de/?key=KEY&to=491701234567&message=#{URI.encode(sms.text)}&route=direct&from=SENDER&charset=UTF-8")
  end

  it 'allows changing the route on the fly' do

    sms = SmsGateway::Sms.new(:to => '491701234567', :text => "SMSTEXT", :from => 'SENDER', :route => 'basic')

    stub_request(:get, "http://gateway.smstrade.de/?charset=UTF-8&from=SENDER&key=KEY&message=#{URI.encode(sms.text)}&route=basic&to=491701234567").
        to_return(:status => 200, :body => "", :headers => {})

    sms.deliver

    assert_requested(:get, "http://gateway.smstrade.de/?key=KEY&to=491701234567&message=#{URI.encode(sms.text)}&route=basic&from=SENDER&charset=UTF-8")

  end

end




