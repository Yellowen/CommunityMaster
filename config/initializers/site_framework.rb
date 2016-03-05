SiteFramework::Engine.setup do |config|
  if Rails.env.development? || Rails.env.test?
    config.view_path_prefix = "#{Rails.root}/../templates/views"
  else
    fail "We have to alter the external templates path"
  end
end
