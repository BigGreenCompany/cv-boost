require "test_helper"

class AiMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ai_message = ai_messages(:one)
  end

  test "should get index" do
    get ai_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_experience_ai_message_url
    assert_response :success
  end

  test "should create ai_message" do
    assert_difference("AiMessage.count") do
      post ai_messages_url, params: { ai_message: { content: @ai_message.content, experience_id: @ai_message.experience_id, role: @ai_message.role } }
    end

    assert_redirected_to experience_ai_message_url(AiMessage.last)
  end

  test "should show ai_message" do
    get experience_ai_message_url(@ai_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_experience_ai_message_url(@ai_message)
    assert_response :success
  end

  test "should update ai_message" do
    patch experience_ai_message_url(@ai_message), params: { ai_message: { content: @ai_message.content, experience_id: @ai_message.experience_id, role: @ai_message.role } }
    assert_redirected_to experience_ai_message_url(@ai_message)
  end

  test "should destroy ai_message" do
    assert_difference("AiMessage.count", -1) do
      delete experience_ai_message_url(@ai_message)
    end

    assert_redirected_to ai_messages_url
  end
end
