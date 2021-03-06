class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  # NOTE:
  # commentable = that can be commented
  # could be a song, artist, album or list

  belongs_to :user

  default_scope { order(created_at: :desc) }
end
