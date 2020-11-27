class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def new
    @tweet = TweetsTag.new
  end

  def create
    @tweet = TweetsTag.new(tweet_params)
    if @tweet.valid?
      @tweet.save
      return redirect_to root_path
    else
      render "new"
    end
  end

  private
  def tweet_params
    params.require(:tweets_tag).permit(:text, :name, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end
