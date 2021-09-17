require_relative 'boot'

require 'rails/all'


Bundler.require(*Rails.groups)

module InstagramClone
  class Application < Rails::Application
    config.load_defaults 5.2

    config.time_zone = 'Africa/Porto-Novo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja
    config.generators do |g|
      # The description in these two lines creates a Settings that is not automatically generated.
      g.assets false
      g.helper false
    end
  end
end
