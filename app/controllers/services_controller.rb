class ServicesController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :find_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to services_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit

  end

  def update
    @service.update_attributes(service_params)
    redirect_to services_path
  end


  private

  def find_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :price)
  end
end
