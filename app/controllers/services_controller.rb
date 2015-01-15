class ServicesController < ApplicationController
  before_action :authenticate_admin!, except: [:show]
  before_action :find_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @sevice = Service.create(service_params)
    
  end

  def show
  end

  def edit
  end


  private

  def find_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :price)
  end
end
