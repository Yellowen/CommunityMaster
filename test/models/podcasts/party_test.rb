# == Schema Information
#
# Table name: podcasts_parties
#
#  id             :integer          not null, primary key
#  episode_id     :integer
#  participant_id :integer
#  host           :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  site_id        :integer
#

require 'test_helper'

class Podcasts::PartyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
