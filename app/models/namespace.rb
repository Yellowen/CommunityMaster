class Namespace < ApplicationRecord
  has_many :domains, class_name: 'SiteFramework::Domain'

  validates :name, presence: true
end
