class RemoveNicknameToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :nickname, :text
  end
end
