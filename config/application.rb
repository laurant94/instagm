require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module Facebook
  class Application < Rails::Application
    config.load_defaults 5.2
    
    config.site = {
      name: "Instagm"
    }

    config.i18n.default_locale = :fr

    config.time_zone = 'Africa/Porto-Novo'
    config.active_record.default_timezone = :local

    config.generators do |g|
      g.assets false
      g.helper false
      g.test_framework false
      g.jbuilder false
    end
  end
end
