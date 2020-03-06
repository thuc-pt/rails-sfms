class Pitch < ApplicationRecord
  has_many :sub_pitches, dependent: :destroy
  has_many :teams, dependent: :nullify
  has_many :matches, dependent: :nullify
  has_many :getting_matches, dependent: :nullify
  belongs_to :user
  belongs_to :province
  belongs_to :district

  EMAIL = /\A[^@\s]+@[^@\s]+\z/
  PARAMS = %i(name province_id district_id address email phone_number
    link_facebook open_at close_at image description active).freeze

  validates :name, presence: true, length: {maximum: Settings.length.max_pitch_name}
  validates :province_id, :district_id, :user_id, presence: true
  validates :address, presence: true, length: {maximum: Settings.length.max_address}
  validates :phone_number, numericality: true, length: {is: Settings.length.phone}
  validates :email, format: {with: EMAIL}
  validates :open_at, :close_at, presence: true
  validate :close_at_must_after_open_at

  mount_uploader :image, ImageUploader

  scope :correct_pitches, ->(user_id){where user_id: user_id}
  scope :on_the_same_area, (lambda do |pitch|
    where province_id: pitch.province_id, district_id: pitch.district_id
  end)

  delegate :name, :email, to: :user, prefix: true
  delegate :name, to: :district, prefix: true, allow_nil: true
  delegate :name, to: :province, prefix: true, allow_nil: true

  def full_address
    address << " - " << district_name << " - " << province_name
  end

  private

  def close_at_must_after_open_at
    errors.add(:close_at, I18n.t(".must_greater_than_open_at")) if
      open_at.present? && close_at.present? && close_at <= open_at
  end
end
