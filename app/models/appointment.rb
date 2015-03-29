class Appointment < ActiveRecord::Base
  has_and_belongs_to_many :services, dependent: :destroy
  has_one :order, dependent: :destroy
  belongs_to :customer

  enum status: [:pending, :completed, :canceled]

  delegate :first_name, :last_name, :phone, :bio, :avatar, to: :customer

  validates :date, :customer_id, presence: true

  accepts_nested_attributes_for :customer, allow_destroy: true
  before_save :set_pending, if: :new_record?


  def set_pending
  	self.status = 'pending'
  end
end
