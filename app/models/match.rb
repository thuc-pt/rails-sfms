class Match < ApplicationRecord
  has_many :getting_matches, dependent: :destroy
  belongs_to :user
  belongs_to :team
  belongs_to :province
  belongs_to :district
  belongs_to :pitch
  belongs_to :level

  PARAMS = %w(time team_id category province_id district_id pitch_id level_id betting invition).freeze

  validates :category, :betting, :time, :level_id, :user_id, :team_id, :pitch_id,
    :invition, :captain_name, :status, presence: true
  validates :ward, length: {maximum: Settings.length.max_ward_name}
  validates :captain_name, length: {maximum: Settings.length.max_name}
  validates :phone_number, numericality: true,
    length: {maximum: Settings.length.max_phone, minimum: Settings.length.min_phone}, allow_nil: true

  enum category: {invition: 0, searching: 1}
  enum status: {not_yet: 0, had: 1, time_up: 2, cancel: 3}

  scope :in_province, ->(province_id){where province_id: province_id}
  scope :in_level, (lambda do |level_id|
    return if level_id.blank?

    where level_id: level_id
  end)

  delegate :name, to: :team, prefix: true
  delegate :name, to: :pitch, prefix: true
  delegate :name, to: :district, prefix: true
  delegate :name, to: :province, prefix: true
  delegate :name, to: :level, prefix: true

  def full_address
    ward.present? ? (ward + " " + district_name + " " + province_name) : (district_name + " " + province_name)
  end
end
