SiteFramework::Engine.setup do |config|
  if Rails.env.development? || Rails.env.test?
    config.view_path_prefix = "#{Rails.root}/../template_master/templates"
  else
    config.view_path_prefix = "#{Rails.root}/../../shared/template_master/templates"
  end

  config.default_domains = ['localhost', 'example.com']
end
