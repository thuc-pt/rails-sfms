class SubPitchType < ApplicationRecord
  has_many :sub_pitches, dependent: :nullify

  validates :name, presence: true, uniqueness: {case_sensitive: false},
    length: {maximum: Settings.length.max_sub_pitch_type}
end
