class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :last_name
      t.string :first_name
      t.integer :phone

      t.timestamps null: false
    end
  end
end
