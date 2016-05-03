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

require 'test_helper'

class Podcasts::LinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
