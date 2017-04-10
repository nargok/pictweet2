class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :tweet_id
      t.text    :text
      #defaultのt,timestampsにつく　null: falseば削除する
      t.timestamps
    end
  end
end
