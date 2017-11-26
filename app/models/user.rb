# source: https://stackoverflow.com/questions/5123972/ruby-on-rails-password-validation
PASSWORD_FORMAT = /\A
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
/x

class User < ApplicationRecord
  attr_accessor :updating_password

  has_many :artists, foreign_key: :owner_id
  has_many :albums, foreign_key: :owner_id
  has_many :songs, foreign_key: :owner_id

  has_many :favorites, foreign_key: :user_id
  has_many :favorite_songs, through: :favorites, source: :favoritable, source_type: 'Song'
  has_many :favorite_albums, through: :favorites, source: :favoritable, source_type: 'Album'
  has_many :favorite_artists, through: :favorites, source: :favoritable, source_type: 'Artist'
  # NOTE: source_types must be capitalized string, it doesn't work with symbols

  has_many :comments, foreign_key: :user_id
  has_many :comment_songs, through: :comments, source: :commentable, source_type: 'Song'
  has_many :comment_albums, through: :comments, source: :commentable, source_type: 'Album'
  has_many :comment_artists, through: :comments, source: :commentable, source_type: 'Artist'

  has_many :ratings, foreign_key: :user_id
  has_many :rated_songs, through: :ratings, source: :rateable, source_type: 'Song'
  has_many :rated_albums, through: :ratings, source: :rateable, source_type: 'Album'
  has_many :rated_artists, through: :ratings, source: :rateable, source_type: 'Artist'

  has_many :written_messages, foreign_key: :writer_id, class_name: 'WallMessage'
  has_many :write_messages, through: :written_messages, source: :writer
  has_many :received_messages, foreign_key: :receiver_id, class_name: 'WallMessage'
  has_many :receive_messages, through: :received_messages, source: :receiver

  has_many :following, foreign_key: :follower_id, class_name: 'Follow' # I am following
  has_many :following_users, through: :following, source: :follower
  has_many :followers, foreign_key: :followed_id, class_name: 'Follow' # Followers of mine
  has_many :followers_users, through: :followers, source: :followed

  mount_uploader :photo, ImageUploader

  validates :first_name, presence: true, if: :info_required?
  validates :last_name, presence: true, if: :info_required?
  validates :email, presence: true, uniqueness: true, if: :info_required?

  has_secure_password
  validates :password,
    confirmation: true,
    length: { minimum: 8 },
    format: { with: PASSWORD_FORMAT },
    if: :password_required?

  def info_required?
    !updating_password || new_record?
  end

  def password_required?
    updating_password || new_record?
  end

  def full_name
    first_name.capitalize + ' ' + last_name.capitalize
  end

  def image_src
    photo.blank? ? ActionController::Base.helpers.asset_path('user-default.png') : photo
  end

end
