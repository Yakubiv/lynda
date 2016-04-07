class AddLikesToTweets < ActiveRecord::Migration
  def change
    rename_column :twitter_users, :tweets_counts, :tweets_count
    add_column :tweets, :likes_count, :integer, index: true
  end
end
