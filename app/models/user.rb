class User < ApplicationRecord
  has_many :rides

  EMAIL_REGEXP = /\A([\w+\-].?)+@andela+(\.[a-z]+)*\.[a-z]+\z/

  validates :email, uniqueness: { message: I18n.t("errors.user.unique") },
            format: {
                with: EMAIL_REGEXP,
                message: I18n.t("errors.user.invalid_email")
            }

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.first_name = auth.info.given_name
      user.last_name = auth.info.family_name
      user.email = auth.info.email
      user.image_url = auth.info.picture
      user.google_token = auth.credentials.token
      if user.valid?
        user.save!
      end
    end
  end
end
