class Timesheet < ApplicationRecord
  has_many :bookings, dependent: :nullify
  belongs_to :sub_pitch

  validates :start_at, :end_at, :sub_pitch_id, presence: true
  validates :price, presence: true, numericality: {greater_than: Settings.minimum.min_price}
  validate :end_at_must_after_start_at

  PARAMS = %i(start_at end_at price sub_pitch_id).freeze

  scope :correct_sub_pitch, ->(sp_id){where(sub_pitch_id: sp_id).order id: :desc}
  scope :in_pitch, (lambda do |pitch_id|
    joins(:sub_pitch).where "timesheets.sub_pitch_id in (?) and sub_pitches.active = true",
      SubPitch.where(pitch_id: pitch_id).pluck(:id)
  end)

  delegate :name, to: :sub_pitch, prefix: true

  def full_time
    start_at.strftime("%H:%M") << " - " << end_at.strftime("%H:%M")
  end

  private

  def end_at_must_after_start_at
    errors.add(:end_at, I18n.t(".must_greater_than_start_at")) if
      start_at.present? && end_at.present? && end_at <= start_at
  end
end
