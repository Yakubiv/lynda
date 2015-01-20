class CreateTableAppointmentsServices < ActiveRecord::Migration
     def self.up
      create_table :appointments_services, :id => false do |t|
         t.references :appointment
         t.references :service
         t.timestamps
        end
    end

   def self.down
      drop_table :appointments_services
   end
end
