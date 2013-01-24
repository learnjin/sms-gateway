require 'test_helper'

class SmsGateway::Adapters::SmsGatewayTest < Test::Unit::TestCase
  include SmsGateway

  def test_test_adapter

    SmsGateway::Base.config = { 
      :from => '493011111111',
      :user => 'userid',
      :password => 'secret',
      :adapter => 'test'
    }

    sms = Sms.new(:to => '493088888888', :text => "hello")

    assert_equal 0, SmsGateway::Base.deliveries.size
    sms.deliver
    assert_equal 1, SmsGateway::Base.deliveries.size
    
  end


end




