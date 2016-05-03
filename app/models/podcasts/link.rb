# == Schema Information
#
# Table name: podcasts_links
#
#  id         :integer          not null, primary key
#  title      :string
#  href       :string
#  desc       :text
#  episode_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  site_id    :integer
#

class Podcasts::Link < ActiveRecord::Base
  belongs_to :episode, class_name: 'Podcasts::Episode'

  validates_presence_of :title
  validates_presence_of :href

  validates_presence_of :episode

end
