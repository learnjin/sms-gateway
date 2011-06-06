module SmsGateway

  module Adapters

    class SmsGlobal
      require 'httparty'
      include HTTParty
      base_uri 'http://www.smsglobal.com'
      def initialize(config={})
        @config = SmsGateway::Base.config
      end

      def send_sms(sms)
        options = @config.merge({:action => "sendsms", :to => sms.to, :text => sms.text})
        puts options.inspect
        self.class.post('/http-api.php', :query => options)
      end

    end

  end

end


