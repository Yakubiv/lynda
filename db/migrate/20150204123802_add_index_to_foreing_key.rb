class AddIndexToForeingKey < ActiveRecord::Migration
  def change
  	add_index :appointments, :customer_id
  	add_index :orders, :appointment_id
  	add_index :receipts, :order_id
  	add_index :images, :order_id
  end
end
