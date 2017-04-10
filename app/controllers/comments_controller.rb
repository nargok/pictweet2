class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], tweet_id: comment_params[:tweet_id], user_id: current_user.id)
    redirect_to "/tweets/#{@comment.tweet.id}"  #コメント結びつくツイートの詳細画面に遷移する
  end

  private #Commentsコントローラ以外のところから呼び出せないようにする
  def comment_params
    params.permit(:text, :tweet_id)
  end
end
