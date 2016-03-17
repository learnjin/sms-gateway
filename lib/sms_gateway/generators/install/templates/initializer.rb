SMS_SETTINGS =
  YAML.load(File.open(File.join(Rails.root, 'config', 'sms_gateway.yml')))[Rails.env].symbolize_keys

SmsGateway::Base.config = SMS_SETTINGS.symbolize_keys
