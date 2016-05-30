source 'https://rubygems.org'
source 'http://rails-assets.org' do
  gem 'rails-assets-sugar'
  gem 'rails-assets-bootstrap-rtl'
  gem 'rails-assets-jquery-knob'
  gem 'rails-assets-bootstrap-daterangepicker'
  gem 'rails-assets-jquery-sparkline'
  gem 'rails-assets-jquery-icheck'
  gem 'rails-assets-admin-lte'
end

gem 'rails', '5.0.0.rc1'
#gem 'rails', path: '../../rails'

#gem 'sass-rails', '6.0.0.beta1'
gem 'sass-rails', github: 'rails/sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'yellowen-misc'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'minitest-rails', '3.0.0.rc1' #github: 'blowmage/minitest-rails', branch: 'rails5'
  gem 'guard'
  gem 'rb-fsevent'
  gem 'capybara'
  gem 'connection_pool'
  gem 'launchy'
  gem 'minitest-reporters'
  gem 'poltergeist'
  gem 'fabrication'
  gem 'minitest-rails-capybara', '3.0.0.rc1'#github: 'blowmage/minitest-rails-capybara', branch: 'rails5'
  gem 'minitest-around'
  gem 'database_cleaner'
  gem 'guard-minitest'
  gem 'guard-cane'
  gem 'rack-livereload'
  gem 'quiet_assets'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  #gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'quiet_assets'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv', :github => "capistrano/rbenv"
  gem 'capistrano-rails'
  gem 'capistrano-passenger'
  gem 'capistrano-local-precompile', require: false
  gem 'capistrano-linked-files'

end

gem 'jquery-turbolinks'
gem 'paperclip'
gem 'pg'
#gem 'devise', '~>4.0.0.beta1'
gem 'devise', :github => 'plataformatec/devise'
gem 'pundit', :github => 'elabs/pundit'
#gem 'dotenv-rails'


development_file = [File.expand_path(File.dirname(__FILE__)),
                    ".development"].join("/")

if File.exists?(development_file)
  gem 'faalis',          path: '../Faalis/'
  gem 'faalis-comments', path: '../faalis_comments'
  gem 'faalis-media',    path: '../faalis_media', require: 'faalis/media'
  gem 'faalis-page',     path: '../faalis_page'
  gem 'faalis-blog',     path: '../faalis_blog'
  gem 'faalis-tags',     path: '../faalis_tags'
  gem 'faalis-shop',     path: '../faalis_shop'

  gem 'site_framework',  path: '../site_framework'
  gem 'amd', path: '../amd'
  #gem 'sass', path: '../sass'
  #gem 'sprockets', path: '../sprockets'

else
  gem 'faalis-comments', :github => 'Yellowen/faalis-comments'
  gem 'faalis-media',    :github => 'Yellowen/faalis_media', require: 'faalis/media'
  gem 'faalis-page',     :github => 'Yellowen/faalis_page'
  gem 'faalis-blog',     :github => 'Yellowen/faalis_blog'
  gem 'faalis-tags',     :github => '../faalis_tags'
  gem 'faalis',          :github => 'Yellowen/Faalis'
  gem 'site_framework',  :github => 'Yellowen/site_framework'
  gem 'faalis-shop',     :github =>  'Yellowen/faalis_shop'
  #gem 'sass', github: 'Yellowen/sass', branch: '3422'
  #gem 'sprockets', github: 'Yellowen/sprockets', branch: '3.x'
end

# Gems to update with rails 5

gem 'acts-as-taggable-on', github: 'mbleigh/acts-as-taggable-on'
gem 'liquid-rails', path: '../liquid-rails'
gem 'ionicons-rails', path: '../ionicons-rails'
