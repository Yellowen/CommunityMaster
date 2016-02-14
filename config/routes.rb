Rails.application.routes.draw do
  mount Faalis::Engine => '/'

  api_routes do
    # Your API routes goes here.
  end

  in_dashboard do
    scope :podcasts do
      resources :episodes
      resources :parties
      resources :participants
      resources :links
    end
  end
end
