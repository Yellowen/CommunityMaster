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

  before do
    @@subject = ::Category
    #@category = Fabricate(:category)
  end

  test "won't save without a name" do
    subject = @@subject.new(description: 'desc')

    result = subject.save

    assert_not result, msg: 'Site Category saved without a title.'
  end

  test "category site name is unique" do
    @@subject.create(name: 'c1')
    c2 = @@subject.new(name: 'c2')

    result = c2.save

    assert_not result, msg: 'Site Category saved with permalink duplication'
  end

end
