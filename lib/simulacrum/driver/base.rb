module Simulacrum
  module Driver
    # Base class for Drivers to inherit
    class Base
      def initialize
        register_driver
        configure_capybara
      end

      private

      def register_driver
        Capybara.register_driver driver_name do |app|
          Capybara::Selenium::Driver.new(
            app,
            browser: :remote,
            url: selenium_remote_url,
            desired_capabilities: capabilities,
            http_client: http_client
          )
        end
      end

      def capabilities
        # Abstract
      end

      def configure_capybara
        Capybara.server_host       = 'localhost'
        Capybara.server_port       = ENV['APP_SERVER_PORT'].to_i
        Capybara.default_wait_time = 10
        Capybara.default_driver    = driver_name
      end

      def selenium_remote_url
        ENV['SELENIUM_REMOTE_URL']
      end

      def driver_name
        ENV['BS_DRIVER_NAME']
      end
    end
  end
end