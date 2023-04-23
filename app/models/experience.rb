class Experience < ApplicationRecord
  belongs_to :user

  enum category: {
    work: "work",
    education: "education"
  }
end
