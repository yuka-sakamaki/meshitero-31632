class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @tweets = Tweet.all.order(created_at: :desc)
    #@tweet_tags = Tag.all
  end

  def new
    @tweet = TweetsTag.new
  end

  def create
    @tweet = TweetsTag.new(tweet_params)           
    #@tweet_tags = params[:tweet][:name]
    if @tweet.valid?
      @tweet.save
      return redirect_to root_path
    else
      render "new"
    end
 end

  def show
    @tweet = Tweet.find(params[:id])
    #@tweet_tags = @tweet.tags
  end

  def edit
    @tweet = Tweet.find(params[:id])
    #@tweet_tags = @tweet.tags.pluck(:name).join(",") #タグのnameの配列を取得
  end

  def update
    @tweet = Tweet.find(params[:id])
    #@tweet_tags = params[:tweet][:name].split(',')
    if @tweet.update(tweet_params)
      #flash[:success] = '投稿を編集しました‼'
      redirect_to @tweet
    else
      render "edit"
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.destroy
      redirect_to root_path
    end
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
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
