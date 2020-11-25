class Tweet < ApplicationRecord
  has_many :tweet_tag_relations
  has_many :tags, through: :tweet_tag_relations

  validates :text, presence: true
end
