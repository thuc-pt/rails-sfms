class User < ApplicationRecord
  has_many :pitches, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :teams, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_many :getting_matches, dependent: :destroy
  has_many :notifications, as: :receiver

  devise :database_authenticatable, :registerable, :confirmable, :recoverable,
    :rememberable, :validatable, :lockable, :timeoutable, :trackable, :omniauthable

  PARAMS = %i(name email phone_number address birthday gender).freeze

  validates :name, presence: true, length: {maximum: Settings.length.max_name}
  validates :phone_number, presence: true, numericality: true,
    length: {maximum: Settings.length.max_phone, minimum: Settings.length.min_phone}, allow_nil: true
  validates :role, presence: true

  mount_uploader :image, ImageUploader

  enum role: {admin: 0, owner: 1, player: 2}

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
