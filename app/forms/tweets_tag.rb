class TweetsTag

  include ActiveModel::Model
  attr_accessor :text, :name, :user_id, :image

  # # with_options presence: true do
  # #   validates :text
  # #   validates :name
  # #   validates :image
  # end

  def save
    tweet = Tweet.create(text: text)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    TweetTagRelation.create(tweet_id: tweet.id, tag_id: tag.id)
  end

end