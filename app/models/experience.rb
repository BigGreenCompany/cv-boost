class Experience < ApplicationRecord
  belongs_to :user
  has_many :ai_messages

  enum category: {
    work: "work",
    education: "education"
  }

  has_rich_text :description

  validate :description_cannot_include_attachments

  private

  def description_cannot_include_attachments
    if description.body.attachments.any?
      errors.add(:description, "cannot include attachments")
    end
  end
end
