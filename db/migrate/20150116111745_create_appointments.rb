class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :status
      t.datetime :date

      t.timestamps null: false
    end
  end
end
