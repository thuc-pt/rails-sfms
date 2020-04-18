class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user
  belongs_to :team

  validates :content, :user_id, :team, presence: true

  PARAMS = %i(content image team_id user_id).freeze

  mount_uploader :image, ImageUploader

  scope :update_later, ->{order updated_at: :desc}
  scope :of_team, ->(team){where team: team}

  delegate :name, to: :user, prefix: true
end
