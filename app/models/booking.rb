class Booking < ApplicationRecord
  belongs_to :timesheet
  belongs_to :user
  belongs_to :team

  validates :name, presence: true, length: {maximum: Settings.length.max_name}
  validates :phone_number, presence: true, numericality: true, length: {is: Settings.length.phone}
  validates :date, :status, :user_id, :timesheet_id, presence: true
  validates :price, presence: true, numericality: {greater_than: Settings.minimum.min_price}

  enum status: {place: 0, playing: 1, finish: 2, cancel: 3}
end
