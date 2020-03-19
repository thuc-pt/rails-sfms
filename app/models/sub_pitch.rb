class SubPitch < ApplicationRecord
  has_many :timesheets, dependent: :destroy
  belongs_to :pitch
  belongs_to :sub_pitch_type

  validates :name, presence: true, length: {maximum: Settings.length.max_sub_pitch_name}
  validates :sub_pitch_type_id, :pitch_id, presence: true

  PARAMS = %i(name is_new description active pitch_id sub_pitch_type_id).freeze

  scope :correct_pitch, ->(pitch_id){where("sub_pitches.pitch_id = ?", pitch_id).order id: :desc}
  scope :is_active, ->{where active: true}

  delegate :name, to: :sub_pitch_type, prefix: true
end
