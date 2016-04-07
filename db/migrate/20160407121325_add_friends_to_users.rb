class AddFriendsToUsers < ActiveRecord::Migration
  def change
    add_column :twitter_users, :friends_count, :integer
  end
end
