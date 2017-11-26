class NewsRelation < ApplicationRecord
  belongs_to :newsable, polymorphic: true
  # NOTE:
  # newsable is news-able, that can be put in a news
  # newsable models are artists, albums and songs

  belongs_to :news

  default_scope { order(created_at: :desc) }
end
