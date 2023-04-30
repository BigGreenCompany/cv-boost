module User::Omniauthable
  extend ActiveSupport::Concern

  class_methods do
    def from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.image_url = auth.info.picture_url
      end
    end
  end
end
