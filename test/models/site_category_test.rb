require "test_helper"

class SiteCategoryTest < ActiveSupport::TestCase

  def site_category
    @site_category ||= SiteCategory.new
  end

  def test_valid
    assert site_category.valid?
  end

end
