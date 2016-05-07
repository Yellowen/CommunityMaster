class Dashboard::SitesController < Dashboard::ApplicationController
  #engine 'SiteFramework::Site'

  override_views :new, :edit
  model_name 'SiteFramework::Site'

  in_form do |form|
    form.attributes except: [:user, :settings]
  end

  private

  def before_create_hook(resource)
    resource.user = current_user

  end

  def new_hook(resource)
    @namespaces = current_user.namespaces
  end
end
