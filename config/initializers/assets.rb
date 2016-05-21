
Dir.glob("#{Rails.application.templates_path}/*") do |f|
  ['stylesheets', 'javascripts', 'fonts', 'images', 'audios', 'videos'].each do |type|
    path = "#{f}/assets/#{type}"
    Rails.application.config.assets.paths.prepend path
  end
end

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
#Rails.application.config.assets.precompile = %w( *.amd.js* *.amd.js.coffee ) + Rails.application.config.assets.precompile
Rails.application.config.assets.precompile += %w( dashboard/rtl/application.css dashboard/ltr/application.css canvas/application.css canvas/application.js )
Rails.application.config.assets.precompile += %w( soprano/ltr/application.css  )
Rails.application.config.assets.precompile += %w( *.png )
Rails.application.config.assets.precompile += %w( *.jpg )
Rails.application.config.assets.precompile += %w( *.gif )
