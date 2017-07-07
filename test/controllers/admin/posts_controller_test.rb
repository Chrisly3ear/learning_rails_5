require 'test_helper'

class Admin::PostsControllerTest < ActionController::TestCase
<<<<<<< HEAD
  test "allow admin user in" do
    user = users(:admin_user)
    @request.session[:user_id] = user.id
=======
  test "index action should be success" do
>>>>>>> a162979d2e2792ab7159cc8721676bff66d642f9
    get :index
    assert_response :success
  end

<<<<<<< HEAD
  test "kick regular user out" do
    user = users(:regular_user)
    @request.session[:user_id] = user.id
    get :index
    assert_response :redirect
  end

=======
>>>>>>> a162979d2e2792ab7159cc8721676bff66d642f9
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
