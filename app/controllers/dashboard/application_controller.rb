class Dashboard::ApplicationController < Faalis::Dashboard::ApplicationController

  def setup_sidebar
    @sidebar = sidebar(t('faalis.engine_name')) do |s|
      s.faalis_entries

      s.menu(t('podcasts'), icon: 'fa fa-volume-up') do
         s.item(t('episodes'),
                url: main_app.dashboard_podcasts_episodes_path,
                model: 'Podcasts::Episode')
         s.item(t('participants'),
                url: main_app.dashboard_podcasts_participants_path,
                model: 'Podcasts::Participant')
         s.item(t('parties'),
                url: main_app.dashboard_podcasts_parties_path,
                model: 'Podcasts::Party')
         s.item(t('links'),
                url: main_app.dashboard_podcasts_links_path,
                model: 'Podcasts::Link')

       end


    end
  end
end
