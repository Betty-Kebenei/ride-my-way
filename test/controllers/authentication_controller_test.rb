require 'test_helper'

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/login'
    assert_response :success
  end

end
