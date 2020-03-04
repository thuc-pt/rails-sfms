class Pitch < ApplicationRecord
  has_many :sub_pitches, dependent: :destroy
  has_many :teams, dependent: :nullify
  has_many :matches, dependent: :nullify
  has_many :getting_matches, dependent: :nullify
  belongs_to :user
  belongs_to :province
  belongs_to :district

  EMAIL = /\A[^@\s]+@[^@\s]+\z/

  validates :name, presence: true, length: {maximum: Settings.length.max_pitch_name}
  validates :province_id, :district_id, :user_id, presence: true
  validates :address, presence: true, length: {maximum: Settings.length.max_address}
  validates :phone_number, numericality: true, length: {is: Settings.length.phone}
  validates :email, presence: true, format: {with: EMAIL}
  validates :open_at, :close_at, presence: true
  validate :close_at_must_after_open_at

  def close_at_must_after_open_at
    errors.add(:close_at, I18n.t(".must_greater_than_open_at")) if
      open_at.present? && close_at.present? && close_at <= open_at
  end
end
