require "test_helper"

class OmniauthCallbacksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include OmniauthTestHelper

  setup do
    OmniAuth.config.test_mode = true
  end

  teardown do
    OmniAuth.config.mock_auth[:linkedin] = nil
  end

  test "should get linkedin" do
    get omniauth_callbacks_linkedin_url, env: { 'omniauth.auth' => mock_auth_hash(:linkedin, users(:linkedin)) }
    assert_response :redirect
    assert_redirected_to root_url
  end
end
