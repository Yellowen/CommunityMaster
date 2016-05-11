Faalis::Engine.setup do |config|
  # Logger settings for Faalis.
  # Default value is the rails logger
  # config.logger = Logger.new(STDOUT)

  config.orm = 'active_record'

  config.site_title = I18n.t('community_master')
  config.slug       = I18n.t('slug')
  config.use_uuid   = true
end
