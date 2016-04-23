class Dashboard::DomainsController < Dashboard::ApplicationController
  #engine 'SiteFramework::Engine'
  model_name 'SiteFramework::Domain'

  in_form do |form|
    form.attributes except: [:user]
  end

  private

  def before_create_hook(resource)
    resource.user = current_user
  end

end
