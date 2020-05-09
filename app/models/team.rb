class Team < ApplicationRecord
  has_many :bookings, dependent: :nullify
  has_many :posts, dependent: :destroy
  belongs_to :user
  belongs_to :level
  belongs_to :province
  belongs_to :district
  belongs_to :pitch

  serialize :member, Array

  PARAMS = %i(name logo image average_age win member description province_id district_id level_id pitch_id user).freeze

  validates :name, presence: true, uniqueness: {case_sensitive: false},
    length: {maximum: Settings.length.max_team_name}
  validates :average_age, presence: true, numericality: {greater_than: Settings.minimum.min_avg_age}
  validates :win, numericality: {greater_than_or_equal: Settings.minimum.min_score}
  validates :user_id, :level_id, :province_id, :district_id, :pitch_id, presence: true

  mount_uploader :logo, ImageUploader
  mount_uploader :image, ImageUploader

  scope :in_province, ->(province_id){where province_id: province_id}
  scope :in_level, (lambda do |level_id|
    return if level_id.blank?

    where level_id: level_id
  end)

  delegate :name, to: :level, prefix: true
  delegate :name, to: :user, prefix: true
  delegate :name, to: :province, prefix: true
  delegate :name, to: :district, prefix: true
  delegate :name, to: :pitch, prefix: true

  def full_address
    district_name + " - " + province_name
  end
end
