class Tweet < ApplicationRecord
  has_many :tweet_tag_relations
  has_many :tags, through: :tweet_tag_relations
  has_many_attached :images

  validates :text, presence: true
  validates :images, presence: true
end
