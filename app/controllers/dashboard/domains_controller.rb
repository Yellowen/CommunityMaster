class Dashboard::DomainsController < Dashboard::ApplicationController
  #engine 'SiteFramework::Engine'
  model_name '::SiteFramework::Domain'

  in_form do |form|
    form.attributes except: [:updated_at, :user]
  end

  protected

  def model_name
    'SiteFramework::Domain'
  end

  private

  def before_create_hook(resource)
    if !current_user.admin?
      resource.user = current_user
      resource.candidate = SiteFramework::Domain.find_by(user_id: current_user.id)
    end
  end

end
