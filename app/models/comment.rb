class Comment < ApplicationRecord
  has_many :comments, as: :tbl_cmt, dependent: :destroy
  has_many :likes, as: :tbl_like, dependent: :destroy
  belongs_to :user
  belongs_to :tbl_cmt, polymorphic: true

  validates :content, :tbl_name, :tbl_id, :user_id, presence: true
end
