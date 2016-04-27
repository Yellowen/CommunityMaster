class Dashboard::SitesController < Dashboard::ApplicationController
  #engine 'SiteFramework::Site'

  model_name 'SiteFramework::Site'

  in_form do |form|
    form.attributes except: [:user, :settings]
  end

  private

  def before_create_hook(resource)
    resource.user = current_user
  end

end
