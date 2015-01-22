class AddIsNewCustomerToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :is_new_customer, :boolean
  end
end
