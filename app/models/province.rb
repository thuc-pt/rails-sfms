class Province < ApplicationRecord
  has_many :districts, dependent: :destroy
  has_many :pitches, dependent: :nullify
  has_many :teams, dependent: :nullify
  has_many :matches, dependent: :nullify
  has_many :getting_matches, dependent: :nullify

  validates :name, presence: true, length: {maximum: Settings.length.max_province_name},
    uniqueness: {case_sensitive: false}

  scope :availability, ->{where "provinces.id in (?)", District.pluck(:province_id).uniq}
  scope :has_pitches, (lambda do
    joins(:pitches).where "provinces.id in (?) and pitches.active = true", Pitch.pluck(:province_id).uniq
  end)
  scope :has_team, ->{where id: Team.pluck(:province_id).uniq}
end
