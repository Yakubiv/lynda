class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.integer :total_cash
      t.integer :order_id
      t.string :total_services

      t.timestamps null: false
    end
  end
end
