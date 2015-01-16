class Appointment < ActiveRecord::Base
	has_and_belongs_to_many :services, join_table: 'appointments_services', class_name: 'Service'
end
