class Level < ApplicationRecord
  has_many :teams, dependent: :nullify
  has_many :matches, dependent: :nullify

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  scope :has_team, ->{where id: Team.pluck(:level_id).uniq}
  scope :has_match, ->{where id: Match.pluck(:level_id).uniq}
end
