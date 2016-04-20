require "test_helper"

class NamespaceTest < ActiveSupport::TestCase

  def namespace
    @namespace ||= Namespace.new
  end

  def test_valid
    assert namespace.valid?
  end

end
