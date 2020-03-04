class District < ApplicationRecord
  has_many :pitches, dependent: :nullify
  has_many :matches, dependent: :nullify
  has_many :getting_matches, dependent: :nullify
  has_many :teams, dependent: :nullify
  belongs_to :province

  validates :name, presence: true, length: {maximum: Settings.length.max_district_name}
  validates :province_id, presence: true
end
