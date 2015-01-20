class CustomersController < ApplicationController
  def index
  end

  def new
  	@customer = Customer.new
  end

  def create
  	@customer = Customer.create(customer_params)
  end

  def show
  end
 private

 def customer_params
 	params.require(:customer).permit(:first_name, :last_name, :phone)
 end
end
