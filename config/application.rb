require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Datn
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # (values shown are the defaults)
    Tripod.configure do |config|
      config.update_endpoint = 'http://127.0.0.1:3030/ds/update'
      config.query_endpoint = 'http://127.0.0.1:3030/ds/sparql'
      config.timeout_seconds = 30
    end
  end
end
