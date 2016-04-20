# Extend SiteFramework::Site class to add extra functionality
SiteFramework::Site.class_eval do

  include Faalis::Concerns::Authorizable
  validates(:title, presence: true)
  validates(:site_category_id, presence: true)

  belongs_to :site_category
  belongs_to :user, class_name: 'Faalis::User'

  validates_associated :site_category
  validates_associated :user

  has_many :domains

end
