class Comment < ActiveRecord::Base
  belongs_to :tweet #tweetテーブルとのアソシエーション
  belongs_to :user  #userテーブルとのアソシエーション
end
