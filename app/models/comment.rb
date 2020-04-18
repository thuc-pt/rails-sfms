class Comment < ApplicationRecord
  has_many :likes, dependent: :destroy
  belongs_to :user

  PARAMS = %i(content image parent_id post_id user_id).freeze

  validates :content, :post_id, :user_id, presence: true

  mount_uploader :image, ImageUploader

  scope :of_posts, ->(ids){where post_id: ids}

  delegate :name, to: :user, prefix: true
end
