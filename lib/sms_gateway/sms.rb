
## The SMS-Object
module SmsGateway
  class Sms < Struct.new(:from, :to, :text)

    def initialize(params)
      self.from = params[:from]||SmsGateway::Base.config[:from]
      self.to = params[:to]
      self.text = params[:text]
    end

    def deliver
      SmsGateway::Base.deliver(:to=>self.to, :from=>self.from, :text=>self.text)
    end

    def deliver_later
      Resque.enqueue(SmsGateway::SmsJob, :to=>self.to, :from=>self.from, :text=>self.text)
    end

    def to_s
      "SMS: from:#{self.from}, to:#{self.to}, text:#{self.text}"
    end

  end
end



