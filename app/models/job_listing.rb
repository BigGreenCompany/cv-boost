class JobListing < ApplicationRecord
  belongs_to :user

  enum job_type: {
    full_time: "full time",
    part_time: "part time",
    contract: "contract"
  }

  has_rich_text :description

  scope :default_order, -> { order(created_at: :desc) }
end
