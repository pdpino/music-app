class News < ApplicationRecord
  has_many :news_relation, foreign_key: :news_id
  has_many :songs_news, through: :news_relation, source: :newsable, source_type: 'Song'
  has_many :albums_news, through: :news_relation, source: :newsable, source_type: 'Album'
  has_many :artists_news, through: :news_relation, source: :newsable, source_type: 'Artist'

  mount_uploader :image, ImageUploader

  def image_src
    image.blank? ? ActionController::Base.helpers.asset_path('news-default.png') : image
  end
end
