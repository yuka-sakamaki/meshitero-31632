class Tweet < ApplicationRecord
  belongs_to :user

  has_many :tweet_tag_relations
  has_many :tags, through: :tweet_tag_relations
  has_one_attached :image

  # def save
  #   tweet = Tweet.create(text: text, image: image, user_id: user_id)
  #   tag = Tag.create(name: name)

  #   TweetTagRelation.create(tweet_id: tweet.id, tag_id: tag.id)
  # end

  # def save_tag(sent_tags)
  #   current_tags = self.tags.pluck(:name) unless self.tags.nil?
  #   old_tags = current_tags - sent_tags
  #   new_tags = sent_tags - current_tags

  #   old_tags.each do |old|
  #     self.tweet_tags.delete TweetTag.find_by(name: old)
  #   end

  #   new_tags.each do |new|
  #     new_tweet_tag = TweetTag.find_or_create_by(name: new)
  #     self.tweet_tags << new_tweet_tag
  #   end
  # end

end
