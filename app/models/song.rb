class Song < ApplicationRecord
  belongs_to :owner, class_name: :users
end
