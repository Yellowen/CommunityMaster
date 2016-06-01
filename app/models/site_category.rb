# == Schema Information
#
# Table name: site_categories
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SiteCategory < ActiveRecord::Base
  has_many :sites, class_name: 'SiteFramework::Site'

  validates :name, presence: true, uniqueness: true
end
