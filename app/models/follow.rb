class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower, uniqueness: { scope: :followed }
  validate :cant_follow_self

  def cant_follow_self
    errors.add(:followed_id, "can't follow yourself!") if follower_id == followed_id
  end
end
