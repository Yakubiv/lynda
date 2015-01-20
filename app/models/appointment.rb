class Appointment < ActiveRecord::Base
	has_and_belongs_to_many :services, join_table: 'appointments_services', class_name: 'Service'
	belongs_to :customer

	accepts_nested_attributes_for :customer, allow_destroy: true , reject_if: :reject_appointment

	def reject_appointment(attributed)
    	attributed['customer_id'].blank?
	end
end
