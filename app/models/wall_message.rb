class WallMessage < ApplicationRecord
  belongs_to :writer, class_name: :user
  belongs_to :receiver, class_name: :user
end
