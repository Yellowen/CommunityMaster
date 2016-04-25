class Namespace < ApplicationRecord
  has_many :domains, class_name: 'SiteFramework::Domain'
  belongs_to :user, class_name: 'Faalis::User'

  validates :name, presence: true
end
