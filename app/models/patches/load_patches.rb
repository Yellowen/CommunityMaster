# This file is more like a manifest to load all the monky patching
# codes to extends external models
require "#{Rails.root}/app/models/patches/faalis_user"
require "#{Rails.root}/app/models/patches/siteframework_site"
require "#{Rails.root}/app/models/patches/siteframework_domain"
