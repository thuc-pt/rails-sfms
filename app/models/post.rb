class Post < ApplicationRecord
  has_many :comments, as: :tbl_cmt, dependent: :destroy
  has_many :likes, as: :tbl_like, dependent: :destroy
  belongs_to :user
  belongs_to :team

  validates :content, :user_id, :team, presence: true
end
