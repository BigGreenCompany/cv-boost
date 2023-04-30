require "test_helper"

class ExperiencesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @experience = experiences(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get experiences_url
    assert_response :success
  end

  test "should get new" do
    get new_experience_url
    assert_response :success
  end

  test "should create experience" do
    assert_difference("Experience.count") do
      post experiences_url, params: {
        experience: {
          started_at: @experience.started_at,
          place: @experience.place,
          title: @experience.title,
          description: @experience.description
        }
      }
    end

    assert_redirected_to experience_url(Experience.last)
  end

  test "should show experience" do
    get experience_url(@experience)
    assert_response :success
  end

  test "should get edit" do
    get edit_experience_url(@experience)
    assert_response :success
  end

  test "should update experience" do
    patch experience_url(@experience), params: { experience: { category: @experience.category, description: @experience.description, ended_at: @experience.ended_at, location: @experience.location, place: @experience.place, started_at: @experience.started_at, user_id: @experience.user_id } }
    assert_redirected_to experience_url(@experience)
  end

  test "should destroy experience" do
    assert_difference("Experience.count", -1) do
      delete experience_url(@experience)
    end

    assert_redirected_to experiences_url
  end
end
