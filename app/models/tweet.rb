class Tweet < ApplicationRecord
  has_many :tweet_tag_relations
  has_many :tags, through: :tweet_tag_relations
  has_one_attached :image
  belongs_to :user

end
