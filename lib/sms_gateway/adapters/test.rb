
module SmsGateway

  class Base

    class << self
      attr_accessor :deliveries
    end

    @deliveries = []
  end


  module Adapters

    class Test

      attr_accessor :deliveries

      def initialize(config={})
        #@logger = Logger.new(STDOUT)
      end

      def send_sms(sms)
        SmsGateway::Base.deliveries << sms
      end

    end
  end
end


