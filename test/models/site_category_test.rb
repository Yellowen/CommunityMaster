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

require "test_helper"

class SiteCategoryTest < ActiveSupport::TestCase

  def site_category
    @site_category ||= SiteCategory.new
  end

  def test_valid
    assert site_category.valid?
  end

end
