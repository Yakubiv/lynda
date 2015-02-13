class ImagesController < ApplicationController
  before_action :find_image, only: [:destroy]

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
  		render :new
  	end
  end

  def destroy
    @image.destrot
  end


private

  def find_image
    @image = Image.find(params[:id])
  end

  def image_params
  	params.require(:image)
          .permit!
  end
end
