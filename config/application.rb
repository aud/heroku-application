require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module HerokuApplication
  class Application < Rails::Application
  end
end
