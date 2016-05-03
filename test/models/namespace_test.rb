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

  def namespace
    @namespace ||= Namespace.new
  end

  def test_valid
    assert namespace.valid?
  end

end
