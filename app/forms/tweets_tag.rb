class TweetsTag

  include ActiveModel::Model
  attr_accessor :text, :name, :image, :user_id

  with_options presence: true do
    validates :text
    validates :name
  end

  def save
    tweet = Tweet.create(text: text, image: image, user_id: user_id)
    tag = Tag.create(name: name).first_or_initialize
    tag.save

    TweetTagRelation.create(tweet_id: tweet.id, tag_id: tag.id)
  end
end