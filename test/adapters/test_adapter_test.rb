require 'test_helper'

describe SmsGateway::Adapters::Test do

  it 'works with the test adapter' do

    SmsGateway::Base.config = { 
      :from => '493011111111',
      :user => 'userid',
      :password => 'secret',
      :adapter => 'test'
    }

    sms = SmsGateway::Sms.new(:to => '493088888888', :text => "hello")

    assert_equal 0, SmsGateway::Base.deliveries.size
    sms.deliver
    assert_equal 1, SmsGateway::Base.deliveries.size

    SmsGateway::Base.deliveries = []
    assert_equal [], SmsGateway::Base.deliveries

  end


end




