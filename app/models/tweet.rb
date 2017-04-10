class Tweet < ActiveRecord::Base
  belongs_to :user #Tweetインスタンス一つ一つは１つのuserインスタンスに属する
  has_many   :comments #commentテーブルとのアソシエーション, 複数形にする
end
