class Artist < ApplicationRecord
  belongs_to :user, foreign_key: :owner_id

  has_many :artist_song
  has_many :songs, through: :artist_song

  has_many :artist_genre
  has_many :genres, through: :artist_genre

  has_many :album_artist
  has_many :albums, through: :album_artist

  has_many :favorites, as: :favoritable
  has_many :user_favorites, through: :favorites, as: :favoritable

  has_many :comments, as: :commentable
  has_many :user_comments, through: :comments, as: :commentable

  has_many :ratings, as: :rateable
  has_many :user_ratings, through: :ratings, as: :rateable

  has_many :news_relation, as: :newsable
  has_many :news, through: :news_relation, as: :newsable

  mount_uploader :image, ImageUploader

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :owner_id, presence: true
  validates :active_since, presence: true
  validate :active_since_in_past, :active_until_between_since_and_today

  def active_since_in_past
    if active_since.present? && active_since > Date.today.year
      errors.add(:active_since, "inválido")
      # FIXME: mejorar mensaje de error (indica "active_since")
    end
  end

  def active_until_between_since_and_today
    if active_until.present?
      if active_until > Date.today.year
        errors.add(:active_until, "debe ser pasada")
      elsif active_since.present? && active_until < active_since
        errors.add(:active_until, "debe ser después que la fecha de inicio")
      end
    end
  end

  def avg_rating
    # REVIEW: change by a oneline rubyish way to do this
    avg = 0
    albums.each { |album| avg += album.avg_rating }
    avg
  end

  def image_src
    # 'artist-default.png'
    image.blank? ? ActionController::Base.helpers.asset_path('artist-default-2.jpg') : image
  end
end
