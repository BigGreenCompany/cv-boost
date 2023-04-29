class JobListing < ApplicationRecord
  has_paper_trail skip: [:created_at, :updated_at]
  belongs_to :user

  enum job_type: {
    full_time: "full time",
    part_time: "part time",
    contract: "contract"
  }

  enum application_status: {
    open: "open",
    sent: "sent",
    interviewing: "interviewing",
    offer: "offer",
    rejected: "rejected"
  }

  has_rich_text :description

  validates :title, presence: true
  validates :employer, presence: true

  scope :default_order, -> { order(created_at: :desc) }

  def prompt
    <<~TEXT
      The applicant is applying to this job.
      ```html
      #{title} at #{employer}
      #{description}
      ```
    TEXT
  end

  def to_s
    "#{title} at #{employer}"
  end
end
