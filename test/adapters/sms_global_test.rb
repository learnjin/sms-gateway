require 'test_helper'

describe SmsGateway::Adapters do

  before do
    SmsGateway::Base.config = { 
      :from => '493011111111',
      :user => 'userid',
      :password => 'secret',
      :adapter => 'sms_global'
    }
  end

  it 'works with sms global' do

    stub_request(:post, "http://www.smsglobal.com/http-api.php?action=sendsms&from=4930123456&password=secret&text=hello&to=493088888888&user=userid").
      to_return(:status => 200, :body => "OK: 0;", :headers => {})

    sms = SmsGateway::Sms.new(:from => '4930123456', :to => '493088888888',
                  :text => "hello")

    sms.deliver

    assert_requested(:post, "http://www.smsglobal.com/http-api.php?action=sendsms&from=4930123456&password=secret&text=hello&to=493088888888&user=userid")
  end

end




