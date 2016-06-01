require 'test_helper'

class Dashboard::NamespacesControllerTest < ActionController::TestCase
  include Devide::TestHelpers

  setup do
    @user   = Fabricate(:user, password: '11111111',
      password_confirmation: '11111111')

    Fabricate(:namespace, user: @user, name: 'namespace-1', locked: false, description: 'sample desc')
    Faalis::Engine.amd = false
  end

    test "is successful" do
      get :index
      assert_response :success
    end

    test "should get show" do
      get :show
      assert_response :success
    end

end
