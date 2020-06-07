class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :receiver, class_name: "User"

  after_create_commit{NotificationBroadcastJob.perform_later 0, self}

  scope :of_user, ->(user){where(receiver_id: user.id).order created_at: :desc}
  scope :not_seen_of_user, ->(user){where receiver_id: user.id, seen: nil}
end
