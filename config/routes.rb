Rails.application.routes.draw do

  devise_for :users
  root 'tweets#index'
  #tweets_controllerへのresourcesメソッド
  #ネスとすることによって、tweet１つ１つについて、関連する処理（コメント付与）ができるようになる、ということ？
  resources :tweets do
    resources :comments, only: [:create]
  end

  resources :users, only: [:show]  #users_controllerへのresourcesメソッド
                                    #usersはshowメソッドしか使わない
  # resourcesメソッドはexcept, onlyを使うことで特定のroutingをすることができる

  # get 'tweets'     => 'tweets#index'      #一覧画面
  # get 'tweets/new' => 'tweets#new'   #投稿画面
  # post 'tweets'    => 'tweets#create'  #ツイート保存機能
  # delete 'tweets/:id' => 'tweets#destroy' #ツイート削除機能
  # patch 'tweets/:id' => 'tweets#update'     #ツイート更新機能
  # get   'tweets/:id/edit' => 'tweets#edit'  ##ツイート編集機能
  # get  'users/:id' => 'users#show'          #マイページ機能
  # get 'tweets/:id' => 'tweets#show'         #ツイート詳細画面
end