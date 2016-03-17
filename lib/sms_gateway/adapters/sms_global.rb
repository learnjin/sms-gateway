module SmsGateway
  module Adapters
    class SmsGlobal
      require 'httparty'
      include HTTParty
      base_uri 'http://www.smsglobal.com'

      def initialize(config = {})
        @config = { user: SmsGateway::Base.user, password: SmsGateway::Base.password,
                    from: SmsGateway::Base.from }
        @config.merge!(config)
      end

      def send_sms(sms)
        options = @config.merge(action: 'sendsms', from: sms.from, to: sms.to, text: sms.text)
        self.class.post('/http-api.php', query: options)
      end
    end
  end
end
