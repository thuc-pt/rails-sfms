class Match < ApplicationRecord
  has_many :getting_matches, dependent: :destroy
  belongs_to :user
  belongs_to :team
  belongs_to :province
  belongs_to :district
  belongs_to :pitch
  belongs_to :level

  validates :category, :ward, :betting, :time, :competitor, :level_id, :user_id,
    :team_id, :pitch_id, :captain_name, :phone_number, :status, presence: true
  validates :ward, length: {maximum: Settings.length.max_ward_name}
  validates :captain_name, length: {maximum: Settings.length.max_name}
  validates :phone_number, presence: true, numericality: true,
    length: {maximum: Settings.length.max_phone, minimum: Settings.length.min_phone}

  enum category: {invition: 0, searching: 1}
  enum status: {not_yet: 0, had: 1, time_up: 2, cancel: 3}
end
