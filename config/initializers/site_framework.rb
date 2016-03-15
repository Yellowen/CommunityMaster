SiteFramework::Engine.setup do |config|
  if Rails.env.development? || Rails.env.test?
    config.view_path_prefix = "#{Rails.root}/../templates/views"
  else
    config.view_path_prefix = "#{Rails.root}/../../shared/templates/views"
    #config.view_path_prefix = shared_path
  end
end
