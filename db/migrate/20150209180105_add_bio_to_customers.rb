class AddBioToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :bio, :string
  end
end
