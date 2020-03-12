class District < ApplicationRecord
  has_many :pitches, dependent: :nullify
  has_many :matches, dependent: :nullify
  has_many :getting_matches, dependent: :nullify
  has_many :teams, dependent: :nullify
  belongs_to :province

  validates :name, presence: true, length: {maximum: Settings.length.max_district_name}
  validates :province_id, presence: true

  scope :in_province, ->(province_id){where province_id: province_id}
  scope :has_pitches, (lambda do
    joins(:pitches).where "districts.id in (?) and pitches.active = true", Pitch.pluck(:district_id).uniq
  end)
end
