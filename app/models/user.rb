class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable, :recoverable,
    :rememberable, :validatable, :lockable, :timeoutable, :trackable, :omniauthable

  class << self
    def from_omniauth auth
      result = User.find_by email: auth.info.email
      return result if result

      get_first_or_create auth
    end

    def get_first_or_create auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.name = auth.info.name
        user.password = Devise.friendly_token[0, 20]
        user.image = auth.info.image
        user.provider = auth.provider
        user.uid = auth.uid
        user.skip_confirmation!
      end
    end
  end
end
