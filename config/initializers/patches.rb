Rails.configuration.after_initialize do
  require "#{Rails.root}/app/models/patches/load_patches"
end
