require 'rails'
require 'rails/generators'

module SmsGateway

  module Generators

    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Creates the initializer and config file template."  
      
      def copy_initializer_file
        copy_file "initializer.rb", "config/initializers/setup_sms_gateway.rb"
      end

      def copy_config_file
        copy_file "setup.yml", "config/sms_gateway.yml"
      end

    end

  end

end


