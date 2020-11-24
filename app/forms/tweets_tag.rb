class TweetsTag

  include ActiveModel::Model
  attr_accessor :message, :name

  with_options presence: true do
    validates :text
    validates :name
  end

  def save
    tweet = Tweet.create(text: text)
    tag = Tag.create(name: name)

    TweetTagRelation.create(tweet_id: tweet.id, tag_id: tag.id)
  end
end