require 'test_helper'

class SiteTest < ActiveSupport::TestCase

  def site_category
    @site ||= Site.new
  end

  def test_valid
    assert site.valid?
  end

end
