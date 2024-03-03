class User < ApplicationRecord
  include Omniauthable
  has_paper_trail only: [:email, :first_name, :last_name, :image_url]
  rolify
  # TODO: add an email service and add confirmable
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
