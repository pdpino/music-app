class Playlist < ApplicationRecord
  validates :name,presence:true, uniqueness: true
  validates :description, presence:true, length: {minimum: 15}
  validates :owner_id, presence:true
  validates :ranking, presence:true, uniqueness: true
end
