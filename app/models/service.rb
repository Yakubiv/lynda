class Service < ActiveRecord::Base
	validates :name, :price, presence: true
	validates :name, uniqueness: { message: 'you already have one' }

end
