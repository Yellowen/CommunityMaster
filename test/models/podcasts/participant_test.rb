# == Schema Information
#
# Table name: podcasts_participants
#
#  id         :integer          not null, primary key
#  name       :string
#  bio        :text
#  twitter    :string
#  github     :string
#  website    :string
#  linkedin   :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class Podcasts::ParticipantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
