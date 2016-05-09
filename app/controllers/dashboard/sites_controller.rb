class Dashboard::SitesController < Dashboard::ApplicationController
  #engine 'SiteFramework::Site'

  override_views :new
  model_name 'SiteFramework::Site'

  in_form do |form|
    form.attributes except: [:user, :settings]
  end

  private

  def before_create_hook(resource)
    @namespace = Namespace.find_or_create_by(
      name: params[:namespace],
      user: current_user)

    @site = SiteFramework::Site.new
    @site.title       = resource.title
    @site.description = resource.description
    @site.user        = current_user
    @site.site_category_id = resource.site_category_id
  end

  def after_create_hook(resource)

    domain = SiteFramework::Domain.new
    domain.namespace = @namespace
    domain.name =      params[:name]
    domain.user =      current_user
    domain.site =      @site
    domain.save!
  end

  def new_hook(resource)
    #@namespaces = current_user.namespaces
    @namespaces = Namespace.where(user_id: current_user.id)
  end

end
