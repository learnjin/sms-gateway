module SmsGateway

  class Base

    class << self
      attr_accessor :from, :user, :password, :key, :route
      attr_reader :adapter

      def configure
        yield(self)
      end

      def adapter=(underscore_name)
         klassname = underscore_name.split("_").map(&:capitalize).join
         klass = SmsGateway::Adapters.const_get(klassname)
         @adapter = klass.new
      end

      def config
        @config
      end

      def config=(options)
        @config = options
        adapter = @config.delete(:adapter)
        @config.each do |k,v|
          self.send "#{k}=", v
        end
        self.adapter = adapter 
      end

      def deliver(options)
        self.adapter.send_sms(SmsGateway::Sms.new(options))
      end

      def self.deliver_later(text, to, from=Base.config[:from]) 
        Resque.enqueue(SmsGateway::Workers::SmsJob, text, to, from) 
      end

    end
  end

end



