class WallMessage < ApplicationRecord
  belongs_to :writer, class_name: "User"
  belongs_to :receiver, class_name: "User"

  default_scope { order(created_at: :desc) }
end
