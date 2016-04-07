class AddOriginIdToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :origin_id, :string
  end
end
