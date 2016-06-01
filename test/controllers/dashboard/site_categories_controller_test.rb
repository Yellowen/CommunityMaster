require 'test_helper'

class Dashboard::SiteCategoriesControllerTest < ActionController::TestCase
  include Devide::TestHelpers

  setup do
    @user   = Fabricate(:user, password: '11111111',
      password_confirmation: '11111111')

    Fabricate(:site_category, user: @user, name: 'cat-1', description: 'sample desc')
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
