class Favorite < ApplicationRecord
  belongs_to :favoritable, polymorphic: true
  # NOTE:
  # favoritable = that can be marked as favorite
  # could be a song, artist, album or list

  belongs_to :user

  validates :favoritable_id, uniqueness: { scope: [:user, :favoritable_type] }
end
