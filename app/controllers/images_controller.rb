class ImagesController < ApplicationController
  def index
  end

  def new
  	@image = Image.new
  end

  def create
  	@order = Order.find(params[:order_id])
  	@image = @order.images.create(image_params)
  	if @image.save
  		redirect_to order_path(@order)
  	else
  		render 'new'
  	end
  end

  def show
    
  end

  private
  def image_params
  	params.require(:image).permit(:file, :description, :order_id)
  end
end
