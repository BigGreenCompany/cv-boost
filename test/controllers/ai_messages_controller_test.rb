require "test_helper"

class AiMessagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @ai_message = ai_messages(:one)
    @experience = @ai_message.experience
    @user = @experience.user
    sign_in @user
  end

  test "should get index" do
    get experience_ai_messages_url(experience_id: @experience.id)
    assert_response :success
  end

  test "should get new" do
    get new_experience_ai_message_url(experience_id: @experience.id)
    assert_response :success
  end

  test "should create ai_message" do
    # TODO: mock call to openai in after_create
    assert_difference("AiMessage.count", 2) do
      post experience_ai_messages_url(experience_id: @experience.id), params: { ai_message: { content: @ai_message.content, experience_id: @ai_message.experience_id, role: @ai_message.role } }
    end

    assert_redirected_to experience_url(id: @experience.id)
  end

  test "should show ai_message" do
    get experience_ai_message_url(experience_id: @experience.id, id: @ai_message.id)
    assert_response :success
  end

  test "should get edit" do
    get edit_experience_ai_message_url(experience_id: @experience.id, id: @ai_message.id)
    assert_response :success
  end

  test "should update ai_message" do
    patch experience_ai_message_url(experience_id: @experience.id, id: @ai_message.id), params: { ai_message: { content: @ai_message.content, experience_id: @ai_message.experience_id, role: @ai_message.role } }
    assert_redirected_to experience_url(id: @experience.id)
  end

  test "should destroy ai_message" do
    assert_difference("AiMessage.count", -1) do
      delete experience_ai_message_url(experience_id: @experience.id, id: @ai_message.id)
    end

    assert_redirected_to experience_url(id: @experience.id)
  end
end
