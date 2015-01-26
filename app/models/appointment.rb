class Appointment < ActiveRecord::Base
    has_and_belongs_to_many :services, dependent: :destroy
    belongs_to :customer

    accepts_nested_attributes_for :customer, allow_destroy: true

end
