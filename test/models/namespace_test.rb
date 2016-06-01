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

require "test_helper"

class NamespaceTest < ActiveSupport::TestCase

  before do
    @@subject = ::Category
    @user     = Fabricate(:user, password: '11111111',
            password_confirmation: '11111111')
  end


  test "won't save without a name" do
    subject = @@subject.new(description: 'desc', user: @user)

    result = subject.save

    assert_not result, msg: 'Namespace saved without a title.'
  end

  test "category site name is unique" do
    @@subject.create(name: 'c1')
    c2 = @@subject.new(name: 'c2')

    result = c2.save

    assert_not result, msg: 'Site Category saved with permalink duplication'
  end

  test "won't save without a user" do
    subject = @@subject.new(name: 'name', description: 'desc')

    result = subject.save

    assert_not result, msg: 'Namespace saved without a user.'
  end

end
