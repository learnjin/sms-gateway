## The SMS-Object
module SmsGateway
  class Sms < Struct.new(:from, :to, :text, :route)

    def initialize(params)
      self.from = params[:from]||SmsGateway::Base.from
      self.to = params[:to]
      self.text = params[:text]
      self.route = params[:route]
    end

    def deliver
      SmsGateway::Base.deliver(self)
    end

    def to_s
      "SMS: from:#{self.from}, to:#{self.to}, text:#{self.text}"
    end

  end
end



