require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FoodHunt
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
      # ActionMailer::Base.smtp_settings = {
      # :address   => "smtp.mandrillapp.com",
      # :port      => 587,
      # :enable_starttls_auto => true,
      # :user_name => "adisazizan@gmail.com",
      # :password  => "n1KXLoaJFJvq-7fGg_L4Aw", # SMTP password is any valid API key
      # :authentication => "plain"
      # }
#     config.action_mailer.smtp_settings = {
#   :address   => "smtp.mandrillapp.com",
#   :port      => 25,
#   :user_name => "adisazizan@gmail.com",
#   :password  => "4pbkGx8NFIWIbPEc-6K1JA"
# }

# config.action_mailer.default_url_options = { :host => "localhost:3000" }
config.action_mailer.delivery_method = :smtp
 config.action_mailer.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 587, # ports 587 and 2525 are also supported with STARTTLS
    :enable_starttls_auto => true, # detects and uses STARTTLS
    :user_name => "adisazizan@gmail.com",
    :password  => "n1KXLoaJFJvq-7fGg_L4Aw", # SMTP password is any valid API key
    :authentication => 'login', # Mandrill supports 'plain' or 'login'
    :domain => 'tutorial-1-adisnabawi.c9.io', # your domain to identify your server when connecting
  }
  end
end
