require "test_helper"

class AiMessageTest < ActiveSupport::TestCase
  test "fixture data is valid" do
    AiMessage.all.each do |ai_message|
      assert ai_message.valid?, "#{ai_message.errors.full_messages}"
    end
  end
end
