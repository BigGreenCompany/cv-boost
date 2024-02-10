class Ahoy::Visit < ApplicationRecord
  self.table_name = "ahoy_visits"

  has_many :events, class_name: "Ahoy::Event", dependent: :destroy
  belongs_to :user, optional: true

  # TODO: remove after increasing Heroku db plan (issue #29)
  after_create :trim_old_visits

  def trim_old_visits
    Ahoy::Visit.excluding(Ahoy::Visit.order(started_at: :desc).limit(2500))
               .delete_all
  end
end
