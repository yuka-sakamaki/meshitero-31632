class TweetsTag

  include ActiveModel::Model
  attr_accessor :text, :name, :image, :user_id
  
  with_options presence: true do
    validates :text
    validates :name
    validates :image
  end

  def save
    tweet = Tweet.create(text: text, image: image, user_id: user_id)
    tag = Tag.create(name: name)

    TweetTagRelation.create(tweet_id: tweet.id, tag_id: tag.id)
  end

  def save_tags(savetweet_tags)
    savetweet_tags.each do |new_name|
    tweet_tag = Tag.find_or_create_by(name: new_name)
    self.tags << tweet_tag
    end

    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - savetweet_tags
    new_tags = savetweet_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name: old_name)
    end

    new_tags.each do |new_name|
      tweet_tag = Tag.find_or_create_by(name: new_name)
      self.tags << tweet_tag
    end
  end

end