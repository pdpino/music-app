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
  
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :owner_id, presence: true
end
