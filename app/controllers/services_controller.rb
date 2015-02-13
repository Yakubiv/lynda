class ServicesController < ApplicationController
  before_action :authenticate_admin!
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
      redirect_to :new
      flash[:error] = "This fields should be filled"
    end
  end

  def show
  end

  def edit

  end

  def update
    if @service.update_attributes(service_params)
      redirect_to services_path
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
    redirect_to services_path
  end

  private

  def find_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit!
  end
end
