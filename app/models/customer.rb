class Customer < ActiveRecord::Base
	has_many :appointments, dependent: :destroy
end
