
require 'test_helper'

class SmsGateway::ConfigurationTest < Test::Unit::TestCase

  def setup
     SmsGateway::Base.configure do |config|
      config.from = '123456789'
      config.user = 'some_user'
      config.password = 'secret'
      config.adapter = 'test' 
    end
  end

  def test_parse_user
    assert_equal 'some_user', SmsGateway::Base.user
  end

  def test_parse_password
    assert_equal 'secret', SmsGateway::Base.password
  end

  def test_parse_from
    sms = SmsGateway::Sms.new(:text => 'test')
    assert_equal '123456789', sms.from
  end

#  def test_parse_adapter
#    assert_equal SmsGateway::Adapters::Test, SmsGateway::Base.adapter
#  end
#
#  def test_work_config_hash
#    SmsGateway::Base.config = {
#      :from => 'new_from',
#      :user => 'new_user',
#      :password => 'new_password', 
#      :adapter => 'sms_global'}
#    
#    assert_equal 'new_from', SmsGateway::Base.from
#    assert_equal 'new_user', SmsGateway::Base.user
#    assert_equal 'new_password', SmsGateway::Base.password
#    assert_equal SmsGateway::Adapters::SmsGlobal, SmsGateway::Base.adapter
#  end

end





