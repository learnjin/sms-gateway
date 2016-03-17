## The SMS-Object
module SmsGateway
  class Sms < Struct.new(:from, :to, :text, :route, :delivery_report)
    def initialize(params)
      self.from = params[:from] || SmsGateway::Base.from
      self.to = params[:to]
      self.text = params[:text]
      self.route = params[:route]
      self.delivery_report = params[:delivery_report]
    end

    def deliver
      SmsGateway::Base.deliver(self)
    end

    def to_s
      "SMS: from:#{from}, to:#{to}, text:#{text}"
    end
  end
end
