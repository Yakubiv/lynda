class RenameColumns < ActiveRecord::Migration
  def change
    rename_column :tweets, :likes_count, :favorites_count
    rename_column :tweets, :content, :text
  end
end
