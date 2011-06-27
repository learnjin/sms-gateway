module SmsGateway

  class Base

    class << self
      attr_accessor :from, :user, :password
      attr_reader :adapter

      def configure
        yield(self)
      end

      def adapter=(underscore_name)
         klassname = underscore_name.split("_").map(&:capitalize).join
         klass = SmsGateway::Adapters.const_get(klassname)
         @adapter = klass.new
      end

      def config=(options)
        @config = options.symbolize_keys 
        @config.each do |k,v|
          self.send "#{k}=", v
        end
      end

      def deliver(options)
        self.adapter.send_sms(SmsGateway::Sms.new(options.symbolize_keys))
      end

      def self.deliver_later(text, to, from=Base.config[:from]) 
        Resque.enqueue(SmsGateway::Workers::SmsJob, text, to, from) 
      end

    end
  end

end



