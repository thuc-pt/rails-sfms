class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tbl_like, polymorphic: true

  validates :user_id, :tbl_name, :tbl_id, presence: true
end
