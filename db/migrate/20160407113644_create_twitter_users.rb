class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :name
      t.string :nickname
      t.string :profile_image_url
      t.integer :tweets_counts
      t.integer :followers_count

      t.timestamps null: false
    end
  end
end
