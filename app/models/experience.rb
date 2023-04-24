class Experience < ApplicationRecord
  belongs_to :user
  has_many :ai_messages

  enum category: {
    work: "work",
    education: "education"
  }
end
