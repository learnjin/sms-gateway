module SmsGateway

  class Base

    class << self
      attr_accessor :connection
      attr_reader :config

      def config=(options)
        @config = options.symbolize_keys 
        klassname = @config[:adapter].to_s.split("_").map(&:capitalize).join
        klass = SmsGateway::Adapters.const_get(klassname)
        self.connection = klass.new
      end

      def deliver(options)
        self.connection.send_sms(SmsGateway::Sms.new(options.symbolize_keys))
      end

      def self.deliver_later(text, to, from=Base.config[:from]) 
        Resque.enqueue(SmsGateway::Workers::SmsJob, text, to, from) 
      end

    end
  end

end



