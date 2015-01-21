class Appointment < ActiveRecord::Base
	has_and_belongs_to_many :services, class_name: 'Service', dependent: :destroy
	belongs_to :customer, dependent: :destroy

	accepts_nested_attributes_for :customer, allow_destroy: true , reject_if: :reject_appointment

	def reject_appointment(attributed)
    	attributed['customer_id'].blank?
	end

	
end
