class AddStutsToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :status, :integer
  end
end
