require 'test_helper'

class Admin::PostsControllerTest < ActionController::TestCase
  test "allow admin user in" do
    user = users(:admin_user)
    @request.session[:user_id] = user.id
    get :index
    assert_response :success
  end

  test "kick regular user out" do
    user = users(:regular_user)
    @request.session[:user_id] = user.id
    get :index
    assert_response :redirect
  end

  # test "new should be success" do
  #   get :new
  #   assert_response :success
  # end
  #
  # test "show should be success" do
  #   post = posts(:hello_world)
  #   get :show, params: { id: post.id }
  #   assert_response :success
  # end


end
