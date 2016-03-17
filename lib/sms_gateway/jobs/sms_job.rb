
module SmsGateway
  class SmsJob
    @queue = :sms_queue
    def self.perform(options)
      SmsGateway::Sms.new(options.symbolize_keys).deliver
    end
  end
end
