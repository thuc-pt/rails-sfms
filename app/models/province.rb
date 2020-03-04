class Province < ApplicationRecord
  has_many :districts, dependent: :destroy
  has_many :pitches, dependent: :nullify
  has_many :teams, dependent: :nullify
  has_many :matches, dependent: :nullify
  has_many :getting_matches, dependent: :nullify

  validates :name, presence: true, length: {maximum: Settings.length.max_province_name},
    uniqueness: {case_sensitive: false}
end
