class Level < ApplicationRecord
  has_many :teams, dependent: :nullify
  has_many :matches, dependent: :nullify

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
