require "openai"

class AiMessage < ApplicationRecord
  belongs_to :experience

  attribute :role, :string, default: 'user'

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
      experience.ai_messages.create(response.dig("choices", 0, "message"))
    end
  end
end
