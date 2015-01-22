class CustomersController < ApplicationController
  before_action :find_customer, only: [:show, :edit, :destroy, :update] 
  
  def index
  	@customers = Customer.all
  end

  def new
  	@customer = Customer.new
  end

  def create
  	@customer = Customer.create(customer_params)
  end

  def show
  end

  def edit
  end

  def update
    @customer.update_attributes(customer_params)
    redirect_to customers_path
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end

 private

 def find_customer
    @customer = Customer.find(params[:id])
  end

 def customer_params
 	params.require(:customer).permit(:first_name, :last_name, :phone)
 end
end
