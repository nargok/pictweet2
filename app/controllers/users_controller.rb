class UsersController < ApplicationController
  def show
    #最後の方で仕様変更：コメント登録者のページが見られるようにする
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")


    #コメント機能実装前↓

    #現在ログインしているユーザのニックネーム
    # @nickname = Tweet.where('current.user.nickname')
    # @nickname = current_user.nickname
    #現在ログインしているユーザが投稿したツイート
    # @tweets = Tweet.where('current_user.user_id.page(params[:page].per(5).order(created_at DESC)')

    #アソシエーション実装前のツイート一覧取得
    # @tweet = Tweet.where(user_id: current_user.id).order("created_at DESC").page(params[:page]).per(5)

    #アソシエーション実装後
    # @tweet = current_user.tweets.order("created_at DESC").page(params[:page]).per(5)

  end
end
