require File.expand_path('../boot', __FILE__)

[
  'action_controller/railtie',
  'action_view/railtie',
  'action_mailer/railtie',
  'active_job/railtie',
  'action_cable/engine',
  'rails/test_unit/railtie',
  'sprockets/railtie'
].each(&method(:require))

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module ZD_Application
  class Application < Rails::Application
    config.encoding = "utf-8"

    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true

    config.assets.enabled = true
    config.assets.version = '1.0'

    config.assets.initialize_on_precompile=false
  end
end
