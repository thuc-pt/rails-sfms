class GettingMatch < ApplicationRecord
  belongs_to :match
  belongs_to :user
  belongs_to :team
  belongs_to :province
  belongs_to :district
  belongs_to :pitch

  validates :user_id, :match_id, :team_id, :province_id,
    :message, :district_id, :pitch_id, presence: true
end
