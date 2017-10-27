class Rating < ApplicationRecord
  belongs_to :rateable, polymorphic: true
  # NOTE:
  # rateable = that can be rated
  # could be a song, artist, album or list

  belongs_to :user

  validates :stars, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }

  default_scope { order(created_at: :desc) }
end
