require "openai"
class AiMessage < ApplicationRecord
  belongs_to :experience

  attribute :role, :string, default: 'user'

  validates :role, presence: true
  validates :content, presence: true, if: :user_role?

  after_create_commit :create_ai_message_content_job, if: :assistant_role?
  after_create_commit :create_assistant_message, if: :user_role?

  broadcasts_to :experience

  scope :to_role_content, -> { select(:role, :content).as_json(only: [:role, :content]) }
  scope :default_order, -> { order(created_at: :asc) }

  def create_ai_message_content_job
    AiMessageContentJob.perform_later(self)
  end

  def create_assistant_message
    AiMessageCreateJob.perform_later({role: "assistant", experience: experience})
  end

  def user_role?
    role == "user"
  end

  def assistant_role?
    role ==  "assistant"
  end

  def system_role?
    role == "system"
  end

  def set_ai_content
    return unless assistant_role?

    response = OpenAI::Client.new.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: previous_messages,
        temperature: 0.7
      }
    )
    raise ::OpenAI::Error.new("An error occurred while communicating with OpenAI.") unless response.success?
    self.content = response.dig("choices", 0, "message", "content")
    save
  end

  def prompt
    <<~TEXT
      #{experience.prompt}
      Please respond using markdown for rich text. No HTML.
    TEXT
  end

  def previous_messages
    experience.ai_messages.where("created_at < ?", created_at).to_role_content.prepend({role: "system", content: prompt})
  end
end
