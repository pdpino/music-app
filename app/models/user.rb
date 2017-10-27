# source: https://stackoverflow.com/questions/5123972/ruby-on-rails-password-validation
PASSWORD_FORMAT = /\A
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
/x

class User < ApplicationRecord
  attr_accessor :updating_password

  has_many :artists, foreign_key: :owner_id
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

  mount_uploader :photo, ImageUploader

  validates :first_name, presence: true, if: :info_required?
  validates :last_name, presence: true, if: :info_required?
  validates :email, presence: true, uniqueness: true, if: :info_required?

  has_secure_password
  validates :password, confirmation: true, length: { minimum: 8 }, format: { with: PASSWORD_FORMAT }, if: :password_required?

  def info_required?
    !password_required?
  end

  def password_required?
    updating_password || new_record?
  end

end
