class TweetsController < ApplicationController

#インデックス以外のアクションがされるときにかならず実行する
  before_action :move_to_index, except: :index

  #アクション名:ツイート一覧画面
  def index
    #最新のツイートを一番上に表示する。1,2のどちらでも可能
    #1.allメソッドに続けてorderメソッドをつける
    # @tweet = Tweet.all.order("created_at DESC")
    #2.orderメソッドを直で使う
    # includesメソッドで関連テーブルを一気に取得する
    @tweet = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

#ツイート投稿画面
  def new
    
  end

  def create
    #tweet_paramsはハッシュ
    # Tweet.create(tweet_params)
    # current_user.culumnメソッド、devise gemが提供するヘルパーメソッド 現在ログイン中のユーザの値を取得する

    # nick nameは自動取得＞表示のため、投稿画面で入力しないようにする
    # Tweet.create(name: tweet_params[:name], image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
      #tweet_paramsはストロングパラメーダ、paramsから:image, :textを抜き出したハッシュ
      # tweet_params自体はprivateメソッドとして下の方で定義されている
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user) #誰が投稿したコメントかだすために
  end

# #不正な値：つまりDBカラムの型に合わない情報を入れられた時にプログラムが落ちることが想定される
#   def create
#     Tweet.cterate(:id, "任意の値")
#   end

# ストロングパラメータという方法で受け取れる
# 値のルール設定をする＞それ以外は受け取らない
  private
  def tweet_params
    # nick nameは自動取得＞表示のため、投稿画面で入力しないようにする
    # params.permit(:name, :image, :text)
    params.permit(:image, :text)
  end

  def move_to_index
    #ログインしていなかった場合に、indexアクションを実行する
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
