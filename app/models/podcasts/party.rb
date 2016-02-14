# == Schema Information
#
# Table name: podcasts_parties
#
#  id             :integer          not null, primary key
#  episode_id     :integer
#  participant_id :integer
#  host           :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Podcasts::Party < ActiveRecord::Base
  belongs_to :episode, class_name: 'Podcasts::Episode'
  belongs_to :participant, class_name: 'Podcasts::Participant'
end
