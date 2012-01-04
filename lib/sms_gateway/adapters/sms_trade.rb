module SmsGateway

  module Adapters

    class SmsTrade
      require 'httparty'
      include HTTParty
      base_uri 'http://gateway.smstrade.de'

      def initialize(config={})
        @config = {:key => SmsGateway::Base.key, :from => SmsGateway::Base.from, :route => SmsGateway::Base.route}
        @config.merge!(config)
      end

      def send_sms(sms)
        options = @config.merge({:to => sms.to, :message => sms.text}) 
        self.class.get('/', :query => options)
      end

    end

  end

end


