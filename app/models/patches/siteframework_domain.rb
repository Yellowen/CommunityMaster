# Extend SiteFramework::Domain class to add extra functionality
SiteFramework::Domain.class_eval do

  include Faalis::Concerns::Authorizable

  # Setup required FS structre for current site instance
  after_create :setup_tree

  belongs_to :namespace
  belongs_to :user, class_name: 'Faalis::User'

  validates_associated :user
  validates_associated :namespace

  def to_fqdn
    return name if self.alias
    cloud_domain = Rails.application.cloud_domain
    "#{name}-#{namespace.name}.#{cloud_domain}"
  end

  private

  def setup_tree
    unless read_attribute :alias
      domain = to_fqdn
      FileUtils.mkdir_p "#{Rails.application.sites_tree}/#{domain}/views"
    end
  end

end
