require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WonderfulPostApp
  class Application < Rails::Application
    # Rails自体のアプリケーションの時刻の設定
    config.time_zone = 'Tokyo'
    # DBを読み書きする際に、DBに記録されている時間をどのタイムゾーンで読み込むかの設定
    config.active_record.default_timezone = :local

    # 対応言語の設定
    config.i18n.available_locales = :ja

    # デフォルトのlocaleを日本語(:ja)にする
    # 複数のローケルファイルが読み込まれるように設定
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.generators do |g|
      g.jbuilder false
      g.javascripts false
      g.stylesheets false
      g.helper false
      g.test_framework :rspec
    end
  end
end
