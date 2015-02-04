class AddAvatarToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :avatar, :string
  end
end
