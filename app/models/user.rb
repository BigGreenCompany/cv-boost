class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable

  has_many :experiences, dependent: :destroy
  has_many :job_listings, dependent: :destroy
end
