class CreateTableOrdersServices < ActiveRecord::Migration
	def self.up
		create_table :orders_services, :id => false do |t|
		 t.references :order
		 t.references :service
		 t.timestamps
		end
	end

	def self.down
		drop_table :orders_services
	end
end
