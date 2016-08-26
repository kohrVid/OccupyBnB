Rails.application.configure do
  config.cache_classes = true

  config.eager_load = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  config.assets.compile = true

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  # config.action_controller.asset_host = 'http://assets.example.com'

  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # config.action_cable.mount_path = nil
  # config.action_cable.url = 'wss://example.com/cable'
  # config.action_cable.allowed_request_origins = [ 'http://example.com', /http:\/\/example.*/ ]

  # config.force_ssl = true

  config.log_level = :debug

  config.log_tags = [ :request_id ]

  # config.cache_store = :mem_cache_store

  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "OccupyBnB_#{Rails.env}"
  config.action_mailer.perform_caching = false

  # config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { 
    host: Rails.application.secrets.mailer_host, 
    from: Rails.application.secrets.mailer_from
  }
  Rails.application.routes.default_url_options[:host] = Rails.application.secrets.mailer_host
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: Rails.application.secrets.gmail_domain,
    authentication: :plain,
    enable_starttls_auto: true,
    user_name: Rails.application.secrets.gmail_username,
    password: Rails.application.secrets.gmail_password
  }


  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new

  # require 'syslog/logger'
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false
  Elasticsearch::Model.client = Elasticsearch::Client.new host: ENV['SEARCHBOX_SSL_URL']
end
