class CustomersController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_customer, only: [:show, :edit, :destroy, :update]

  def index
    if params[:search]
      @customers = Customer.search(params[:search]).paginate(page: params[:page], per_page: 8)
    else
      @customers = Customer.all.paginate(page: params[:page], per_page: 8)
    end
  end

  def new
    @customer = Customer.new
  end


  def create
    @customer = Customer.create(customer_params)
    if @customer.save
      redirect_to customers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @customer.update_attributes(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
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
  params.require(:customer)
        .permit!
 end
end
