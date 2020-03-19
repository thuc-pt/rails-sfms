class Booking < ApplicationRecord
  belongs_to :timesheet
  belongs_to :user

  validates :name, presence: true, length: {maximum: Settings.length.max_name}
  validates :phone_number, presence: true, numericality: true,
    length: {maximum: Settings.length.max_phone, minimum: Settings.length.min_phone}
  validates :date, :status, :user_id, :timesheet_id, presence: true
  validate :date_must_correct

  PARAMS = %i(name phone_number is_fixed passing_note date timesheet_id user_id team_id).freeze

  enum status: {place: 0, confirm: 1, playing: 2, finish: 3, cancel: 4}

  scope :booking_in_date, ->(date = Date.current){where("date = ?", date).place}
  scope :correct_condition, (lambda do |pitch_id, date = Date.current, place = Booking.statuses[:place]|
    joins(timesheet: [sub_pitch: :pitch]).where "pitches.id = ?
      and bookings.date >= ? and bookings.status = ?", pitch_id, date, place
  end)
  scope :already_exist, ->(date, timesheet_id){where "date = ? and timesheet_id = ?", date, timesheet_id}

  delegate :start_at, :end_at, :sub_pitch_name, to: :timesheet, prefix: true, allow_nil: true

  def full_time
    timesheet_start_at.strftime("%H:%M") << " - " << timesheet_end_at.strftime("%H:%M") << " ngày " <<
      date.strftime("%d/%m/%Y")
  end

  private

  def date_must_correct
    errors.add :date, I18n.t("date_incorrect") if date.present? && date < Date.current
  end
end
