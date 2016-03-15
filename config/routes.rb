Rails.application.routes.draw do
  get 'welcome/index'

  mount Faalis::Engine => '/'

  api_routes do
    # Your API routes goes here.
  end


  in_dashboard do
    resources :participants
    resources :parties
    resources :links
    namespace :podcasts do
      resources :episodes
      resources :parties
      resources :participants
      resources :links
    end
  end

  sites(self) do
    mount Faalis::Page::Engine => '/'
    mount Faalis::Blog::Engine => '/'
    mount Faalis::Comments::Engine => '/'
    mount Faalis::Media::Engine => '/'

    root 'welcome#index'
  end

  default_site(self) do
    root 'welcome#index'
  end
end
