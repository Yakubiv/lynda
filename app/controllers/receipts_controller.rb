class ReceiptsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @receipts = Receipt.all
  end

  def new
    @receipt = Receipt.new
  end

  def create
    @order = Order.find(params[:order_id])
    @receipt = Receipt.create(receipt_params)
    @receipt.order = @order
    if @receipt.save
      redirect_to order_receipt_path(@order, @receipt)
    end
  end

  def show
    @receipt = Receipt.find(params[:id])
  end

private

  def receipt_params
    params.require(:receipt).permit(:total_cash, :total_services, :order_id)
  end
  
end
