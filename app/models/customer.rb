class Customer < ActiveRecord::Base
	has_many :appointments, dependent: :destroy
	has_many :orders
	mount_uploader :avatar, AvatarUploader

	validates :first_name, :last_name, presence: true

	default_scope {order(last_name: :ASC)}

	def self.search(query)
	  where('first_name ilike ? OR last_name ilike ?', "%#{query}%", "%#{query}%")
	end
end
