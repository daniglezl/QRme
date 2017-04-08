require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module QRme
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      "#{html_tag}".html_safe
    }

     config.time_zone = 'Eastern Time (US & Canada)'
     
     #mailer configuration

    config.action_mailer.smtp_settings = {
      address:              'smtp.gmail.com',
      port:                 587,
      domain:               ENV["EMAIL_DOMAIN"],
      user_name:            ENV["EMAIL_USERNAME"],
      password:             ENV["EMAIL_PASSWORD"],
      authentication:       :plain,
      enable_starttls_auto: true
    }
  end
end
