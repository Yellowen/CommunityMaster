class Dashboard::DomainsController < Dashboard::ApplicationController
  #engine 'SiteFramework::Engine'

  def model
    SiteFramework::Domain
  end
end
