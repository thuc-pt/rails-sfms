class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :comment, optional: true

  validates :user_id, presence: true

  PARAMS = %i(user_id post_id comment_id).freeze
end
