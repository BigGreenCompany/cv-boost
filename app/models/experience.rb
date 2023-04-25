class Experience < ApplicationRecord
  belongs_to :user
  has_many :ai_messages

  enum category: {
    work: "work",
    education: "education"
  }

  has_rich_text :description

  validate :description_cannot_include_attachments

  def prompt
    <<~TEXT
      You are an expert at reviewing resumes for job applications.
      I want you to give feedback on how to improve this experience.
      It is one of many in the #{category} experience section.
      ```html
      #{place}
      #{title}
      #{location}
      #{description}
      ```
    TEXT
  end

  private

  def description_cannot_include_attachments
    if description.body.attachments.any?
      errors.add(:description, "cannot include attachments")
    end
  end
end
