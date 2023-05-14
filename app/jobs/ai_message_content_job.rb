class AiMessageContentJob < ApplicationJob
  def perform(ai_message)
    ai_message.set_ai_content
  end
end
