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
  validates :phone_number, presence: true, numericality: true,
    length: {maximum: Settings.length.max_phone, minimum: Settings.length.min_phone}
  validates :email, presence: true, format: {with: EMAIL}
  validates :open_at, :close_at, presence: true
  validate :close_at_must_after_open_at

  mount_uploader :image, ImageUploader

  scope :correct_pitches, ->(user_id){where user_id: user_id}
  scope :on_the_same_area, ->(pitch){where province_id: pitch.province_id, district_id: pitch.district_id}
  scope :is_active, ->{where active: true}
  scope :in_province, ->(province_id){where province_id: province_id if province_id.positive?}
  scope :in_district, ->(district_id){where district_id: district_id if district_id.present?}

  delegate :name, :email, to: :user, prefix: true
  delegate :name, to: :district, prefix: true, allow_nil: true
  delegate :name, to: :province, prefix: true, allow_nil: true

  def full_address
    address << " - " << district_name << " - " << province_name
  end

  def sub_pitch_name
    return sub_pitches.first.name if sub_pitches.present?
    I18n.t "none_sub_pitch"
  end

  def timesheet_sub_pitch
    if sub_pitches.present? && sub_pitches.first.timesheets.present?
      sub_pitches.first.timesheets.first.start_at.strftime("%H:%M %p") + " - " +
        sub_pitches.first.timesheets.first.end_at.strftime("%H:%M %p")
    else
      I18n.t "none_timesheet"
    end
  end

  def timesheet_price
    sub_pitches.present? && sub_pitches.first.timesheets.present? ? sub_pitches.first.timesheets.first.price : 0
  end

  private

  def close_at_must_after_open_at
    errors.add(:close_at, I18n.t(".must_greater_than_open_at")) if
      open_at.present? && close_at.present? && close_at <= open_at
  end
end
