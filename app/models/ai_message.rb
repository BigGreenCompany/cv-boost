require "openai"

# TODO: rename to "Message"
class AiMessage < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :experience

  enum role: { user: "user", assistant: "assistant", system: "system" }, _suffix: true

  validates :role, presence: true
  validates :content, presence: true

  after_create_commit :fetch_openai_response, if: :user_role?
  after_create_commit -> { broadcast_created }
  after_update_commit -> { broadcast_updated }

  def broadcast_created
    broadcast_append_later_to(
      "#{dom_id(experience)}_ai_messages",
      partial: "ai_messages/ai_message",
      locals: { ai_message: self, scroll_to: true },
      target: "#{dom_id(experience)}_ai_messages"
    )
  end

  def broadcast_updated
    broadcast_append_to(
      "#{dom_id(experience)}_ai_messages",
      partial: "ai_messages/ai_message",
      locals: { ai_message: self, scroll_to: true },
      target: "#{dom_id(experience)}_ai_messages"
    )
  end

  broadcasts_to :experience

  scope :default_order, -> { order(created_at: :asc) }
  scope :previous_messages, -> { experience.ai_messages.where("created_at < ?", created_at) }
  scope :for_openai, -> { select(:role, :content).as_json(only: [:role, :content]) }

  def fetch_openai_response
    FetchOpenaiResponseJob.perform_later(experience)
  end
end
