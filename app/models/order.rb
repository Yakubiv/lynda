class Order < ActiveRecord::Base
	belongs_to :appointment
	belongs_to :customer
	has_and_belongs_to_many :services
	has_one :receipt

	after_create :set_completed

	def set_completed
		self.appointment.update(status: :completed)
	end
end
