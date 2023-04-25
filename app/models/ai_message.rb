require "openai"

class AiMessage < ApplicationRecord
  class OpenAiUnavailable < StandardError
    def message
      "An error occurred while communicating with OpenAI. Please try again later."
    end
  end

  belongs_to :experience

  attribute :role, :string, default: 'user'

  validates :role, presence: true
  validates :content, presence: true

  after_create :query_chat_gpt

  private

  def query_chat_gpt
    if role == "user"
      client = OpenAI::Client.new(access_token: Rails.application.credentials.dig(:openai, :access_token))
      response = client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          # TODO: save system prompt on first message instead?
          messages: experience.ai_messages.select(:role, :content).to_a.prepend({role: "system", content: experience.prompt}),
          temperature: 0.7
        }
      )
      raise OpenAiUnavailable unless response.success?
      ai_message = response.dig("choices", 0, "message")
      experience.ai_messages.create(ai_message) unless ai_message.nil?
    end
  end
end
