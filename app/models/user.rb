class User < ApplicationRecord
  include Omniauthable
  rolify
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :omniauthable,
         omniauth_providers: [:linkedin]

  has_many :experiences, dependent: :destroy
  has_many :job_listings, dependent: :destroy
end
