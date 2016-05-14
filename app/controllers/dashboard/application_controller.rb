class Dashboard::ApplicationController < Faalis::Dashboard::ApplicationController

  def setup_sidebar
    @sidebar = sidebar(t('faalis.engine_name')) do |s|
      s.faalis_entries
      s.media_entries
      s.page_entries
      s.blog_entries


      s.menu(t('sites'), icon: 'fa fa-sitemap') do
        s.item(t('namespaces'),
          url: main_app.dashboard_namespaces_path,
          model: 'Namespace')
        s.item(t('Site Categories'),
          url: main_app.dashboard_site_categories_path,
          model: 'SiteCategory')
        s.item(t('Sites'),
          url: main_app.dashboard_sites_path,
          model: 'SiteFramework::Site')
        s.item(t('Domains'),
          url: main_app.dashboard_domains_path,
          model: 'SiteFramework::Domain')
      end

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

      s.menu(t('commnts'), icon: 'fa fa-comment') do
        s.item(t('comments'),
          url: faalis_comments.dashboard_comments_path,
          model: 'Faalis::Comments::Comment')
      end

      s.menu(t('shop'), icon: 'fa fa-shop') do
        s.item(t('products categories'),
          url: faalis_shop.dashboard_product_categories_path,
          model: 'Faalis::Shop::Category')
        s.item(t('products'),
          url: faalis_shop.dashboard_products_path,
          model: 'Faalis::Shop::Product')
      end
    end
  end
end
