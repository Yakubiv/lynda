class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :appointment_id
      t.integer :customer_id
      t.integer :tips
      t.string :note

      t.timestamps null: false
    end
  end
end
