class Customer < ActiveRecord::Base
	has_many :appointments
end
