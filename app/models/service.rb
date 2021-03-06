class Service < ActiveRecord::Base
	has_and_belongs_to_many :appointments
	has_and_belongs_to_many :orders

	validates :name, :price, presence: true
	validates :name, uniqueness: { message: 'you already have one' }

  mount_uploader :cover, CoverUploader
end
