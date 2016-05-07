class Dashboard::SitesController < Dashboard::ApplicationController
  #engine 'SiteFramework::Site'

  override_views :new, :edit
  model_name 'SiteFramework::Site'

  in_form do |form|
    form.attributes except: [:user, :settings]
  end

  private

  def before_create_hook(resource)
    domain = 'faalis.io'
    resource.user_id = current_user.id

    if (!params.has_key?(:name) || !params.has_key?(:namespace))
      flash[:error] = t('Fill in the blank')
      byebug
    else

      domain = SiteFramework::Domain.where(
        name: params[:name] + '-' + domain)

      if domain.exists?
        flash[:error] = t('Domain exists')
        byebug
      end

    end
  end

  def after_create_hook(resource)
    byebug
    namespace = Namespace.find_or_create_by(
      name: params[:namespace],
      user: current_user)

    SiteFramework::Domain.create(
      namespace: namespace,
      name: params[:name] + '-' + domain,
      user: current_user,
      site_id: resource.id
    )
  end

  def new_hook(resource)
    @namespaces = current_user.namespaces
  end
end
