require "test_helper"

class OmniauthCallbacksControllerTest < ActionDispatch::IntegrationTest
  test "should get linkedin" do
    get omniauth_callbacks_linkedin_url
    assert_response :success
  end
end
