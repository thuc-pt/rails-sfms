class Post < ApplicationRecord
  has_many :comments, as: :tbl_cmt
  has_many :likes, as: :tbl_like
  belongs_to :user
  belongs_to :team

  validates :content, :user_id, :team, presence: true

  PARAMS = %i(content image team_id user_id).freeze

  mount_uploader :image, ImageUploader

  scope :update_later, ->{order updated_at: :desc}

  delegate :name, to: :user, prefix: true
end
