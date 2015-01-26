class AddCoverToServices < ActiveRecord::Migration
  def change
    add_column :services, :cover, :string
  end
end
