# == Schema Information
#
# Table name: namespaces
#
#  id          :integer          not null, primary key
#  locked      :boolean
#  name        :string
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Namespace < ApplicationRecord
  has_many :domains, class_name: 'SiteFramework::Domain'
  belongs_to :user, class_name: 'Faalis::User'

  validates :name, presence: true
  validates :user, presence: true
end
