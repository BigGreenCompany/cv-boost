class Experience < ApplicationRecord
  has_paper_trail skip: [:created_at, :updated_at]

  belongs_to :user
  belongs_to :job_listing, optional: true
  has_many :ai_messages, dependent: :destroy

  enum category: {
    work: "work",
    education: "education"
  }

  has_rich_text :description

  validates :started_at, presence: true
  validates :place, presence: true
  validates :title, presence: true
  validate :description_cannot_include_attachments

  def prompt
    <<~TEXT
      You are an expert at reviewing resumes for job applications.
      #{job_listing&.prompt}
      I want you to give feedback on how to improve the description of this experience.
      This experience is one of many in the #{category} experience section.
      ```html
      #{place}
      #{title}
      #{location}
      #{description}
      ```
    TEXT
  end

  scope :default_order, -> { order(started_at: :desc) }

  private

  def description_cannot_include_attachments
    if description.body.attachments.any?
      errors.add(:description, "cannot include attachments")
    end
  end
end
