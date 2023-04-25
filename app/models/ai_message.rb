require "openai"

class AiMessage < ApplicationRecord
  belongs_to :experience

  attribute :role, :string, default: 'user'

  after_create :query_chat_gpt

  private

  def query_chat_gpt
    if role == "user"
      client = OpenAI::Client.new(access_token: Rails.application.credentials[:openai][:access_token])
      system_prompt = <<~TEXT
        You are an expert at reviewing resumes for job applications.
        I want you to give feedback on how to improve this experience.
        It is one of many in the work experience section.
        ```html
        #{experience.place}
        #{experience.title}
        #{experience.location}
        #{experience.description}
        ```
      TEXT
      response = client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: [
            {role: "system", content: system_prompt},
            # TODO: add previous messages
            {role: role, content: content}
          ],
          temperature: 0.7
        }
      )
      experience.ai_messages.create(response.dig("choices", 0, "message"))
    end
  end
end
