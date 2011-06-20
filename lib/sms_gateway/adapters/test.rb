
module SmsGateway
  module Adapters

    class Test
      def initialize(config={})
        @logger = Logger.new(STDOUT)
      end

      def send_sms(sms)
        @logger.info "would be sending sms: #{sms.to_s}" 
      end

    end
  end
end


