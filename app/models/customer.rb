class Customer < ActiveRecord::Base
	has_many :appointments

	validates :first_name, :last_name, presence: true

	def self.search(query)
	  where('first_name ilike ? OR last_name like ?', "%#{query}%", "%#{query}%") 
	end
end
