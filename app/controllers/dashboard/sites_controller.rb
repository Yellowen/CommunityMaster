class Dashboard::SitesController < Dashboard::ApplicationController
  #engine 'SiteFramework::Site'

  def model
    SiteFramework::Site
  end
end
