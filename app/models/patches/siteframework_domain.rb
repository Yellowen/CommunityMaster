# Extend SiteFramework::Domain class to add extra functionality
SiteFramework::Domain.class_eval do

  include Faalis::Concerns::Authorizable

  belongs_to :namespace
  belongs_to :user, class_name: 'Faalis::User'

  validates_associated :user
  validates_associated :namespace

end
