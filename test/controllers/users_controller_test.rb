require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include UsersHelper

  test "should create user when it doesn't exist" do
    get login_path
    assert_template "users/new"
    assert_select "a", "Log In" 
    post login_path, params: { user: { name: "TEST" } }
    user = User.find_by(name: "TEST")
    assert_equal "User created. Welcome, TEST.", flash[:success]
    assert_equal user, current_user
    assert_redirected_to user_path(user.id)
  end

  test "should login user when it already exists and then logout" do
    User.create(name: "TEST")
    post login_path, params: { user: { name: "TEST" } }
    user = User.find_by(name: "TEST")
    assert_equal "User logged in. Welcome back, TEST.", flash[:success]
    assert_equal user, current_user
    assert_redirected_to user_path(user.id)
    get root_path
    assert_template "events/index"
    assert_select "a", "Log Out"
    delete logout_path
    assert_nil session[:id]
    assert_nil current_user
    assert_redirected_to root_path
  end

end
