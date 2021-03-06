require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module GovCatalyst
  class Application < Rails::Application
    config.load_defaults 5.2
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end
    config.generators.system_tests = nil
    config.time_zone = 'Asia/Manila'
    config.active_record.default_timezone = :local
    # config.active_job.queue_adapter = :delayed_job
  end
end
