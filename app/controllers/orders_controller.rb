class OrdersController < ApplicationController
  def index
    @orders = Order.all.paginate(page: params[:page], per_page: 12)
  end

  def new
    @order = Order.new
  end

  def create
    @appointment = Appointment.find(params[:appointment_id])
    @order = Order.create(order_params)
    @order.appointment = @appointment
    if @order.save
      redirect_to orders_path
    else
      render :noting
    end
  end

  def show
    
  end

  def update
    
  end

  def destroy
    
  end

private

  def order_params
    params.require(:order).permit(:tips, :note, :customer_id, :appointment_id, service_ids: [])   
  end
end
