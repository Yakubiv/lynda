class Appointment < ActiveRecord::Base
  has_and_belongs_to_many :services, dependent: :destroy
  has_one :order
  belongs_to :customer
  enum status: [:pending, :completed, :canceled]

  accepts_nested_attributes_for :customer, allow_destroy: true
  before_save :set_pending, if: :new_record?

  def set_pending
  	self.status = 'pending'
  end
end
