class Timesheet < ApplicationRecord
  has_many :bookings, dependent: :nullify
  belongs_to :sub_pitch

  validates :start_at, :end_at, :sub_pitch_id, presence: true
  validates :price, presence: true, numericality: {greater_than: Settings.minimum.min_price}
  validate :end_at_must_after_start_at

  def end_at_must_after_start_at
    errors.add(:end_at, I18n.t(".must_greater_than_start_at")) if
      start_at.present? && end_at.present? && end_at <= start_at
  end
end
