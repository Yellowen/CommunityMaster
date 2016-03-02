class Dashboard::Podcasts::EpisodesController < Dashboard::ApplicationController
  in_index do |i|
    i.attributes :title, :number, :created_at
  end
end
