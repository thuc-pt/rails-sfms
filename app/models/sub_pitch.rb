class SubPitch < ApplicationRecord
  has_many :timesheets, dependent: :destroy
  belongs_to :pitch
  belongs_to :sub_pitch_type

  validates :name, presence: true, length: {maximum: Settings.length.max_sub_pitch_name}
  validates :sub_pitch_type_id, :pitch_id, presence: true
end
