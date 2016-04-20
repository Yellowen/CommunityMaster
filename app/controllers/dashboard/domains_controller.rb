class Dashboard::DomainsController < Dashboard::ApplicationController
  #engine 'SiteFramework::Engine'

  in_form do |form|
    if !current_user.admin?
      form.attributes except: [:updated_at, :user]
    end
  end

  def model
    SiteFramework::Domain
  end

  def before_create_hook(resource)
    if !current_user.admin?
      resource.user = current_user
      resource.candidate = SiteFramework::Domain.find_by(user_id: current_user.id)
    end
  end

end
