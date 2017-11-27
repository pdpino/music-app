class Album < ApplicationRecord
  belongs_to :user, foreign_key: :owner_id

  has_many :album_song
  has_many :songs, through: :album_song

  has_many :album_artist
  has_many :artists, through: :album_artist

  has_many :favorites, as: :favoritable
  has_many :user_favorites, through: :favorites, as: :favoritable

  has_many :comments, as: :commentable
  has_many :user_comments, through: :comments, as: :commentable

  has_many :ratings, as: :rateable
  has_many :user_ratings, through: :ratings, as: :rateable

  has_many :news_relation, as: :newsable
  has_many :news, through: :news_relation, as: :newsable

  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :owner_id, presence: true

  def avg_rating
    # REVIEW: change by a oneline rubyish way to do this
    avg = 0
    songs.each { |song| avg += song.avg_rating }
    avg
  end

  def image_src
    image.blank? ? ActionController::Base.helpers.asset_path('album-default.jpg') : image
  end
end
