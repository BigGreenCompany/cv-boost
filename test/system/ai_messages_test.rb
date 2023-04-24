require "application_system_test_case"

class AiMessagesTest < ApplicationSystemTestCase
  setup do
    @ai_message = ai_messages(:one)
  end

  test "visiting the index" do
    visit ai_messages_url
    assert_selector "h1", text: "Ai messages"
  end

  test "should create ai message" do
    visit ai_messages_url
    click_on "New ai message"

    fill_in "Content", with: @ai_message.content
    fill_in "Experience", with: @ai_message.experience_id
    fill_in "Role", with: @ai_message.role
    click_on "Create Ai message"

    assert_text "Ai message was successfully created"
    click_on "Back"
  end

  test "should update Ai message" do
    visit experience_ai_message_url(@ai_message)
    click_on "Edit this ai message", match: :first

    fill_in "Content", with: @ai_message.content
    fill_in "Experience", with: @ai_message.experience_id
    fill_in "Role", with: @ai_message.role
    click_on "Update Ai message"

    assert_text "Ai message was successfully updated"
    click_on "Back"
  end

  test "should destroy Ai message" do
    visit experience_ai_message_url(@ai_message)
    click_on "Destroy this ai message", match: :first

    assert_text "Ai message was successfully destroyed"
  end
end
