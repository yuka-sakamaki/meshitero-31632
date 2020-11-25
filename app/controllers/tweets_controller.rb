class TweetsController < ApplicationController

  def index
    @tweet = Tweet.order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :text).merge(user_id: user.id)
  end

end
