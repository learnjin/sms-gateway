require 'test_helper'

describe SmsGateway::Base do
  before do
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
    sms = SmsGateway::Sms.new(text: 'test')
    assert_equal '123456789', sms.from
  end
end
