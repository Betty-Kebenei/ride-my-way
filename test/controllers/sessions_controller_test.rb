require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get `auth/:provider/callback`
    assert_response :success
  end

  test "should get destroy" do
    get `signout`
    assert_response :success
  end

end
