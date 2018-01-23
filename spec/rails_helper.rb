ENV["RAILS_ENV"] = 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
require 'rspec/rails'
require 'capybara/rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.include FactoryBot::Syntax::Methods
  # config.include Rails.application.routes.url_helpers
  # config.include ActiveSupport::Testing::TimeHelpers
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
