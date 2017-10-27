class Song < ApplicationRecord
  belongs_to :user, foreign_key: :owner_id

  has_many :artist_song
  has_many :artists, through: :artist_song

  has_many :song_genre
  has_many :genres, through: :song_genre

  has_many :album_song
  has_many :albums, through: :album_song

  has_many :favorites, as: :favoritable
  has_many :user_favorites, through: :favorites, as: :favoritable

  has_many :comments, as: :commentable
  has_many :user_comments, through: :comments, as: :commentable

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :duration, format: {
    with: /\A\d*:[0-5][0-9]\z/,
    allow_blank: true,
    message: "tiene que ser de la forma minutos:segundos"
  }
  validates :owner_id, presence: true
end
