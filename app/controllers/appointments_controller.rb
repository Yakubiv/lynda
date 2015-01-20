class AppointmentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_appointment, only: [:show, :update, :edit, :destroy] 
  
  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.create(appointment_params)
    @appointment.customer.create
    if @appintment.save
      redirect_to appointments_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @appointment.update_attributes(appointment_params)
    redirect_to services_path
  end

  def destroy
    @appointment.destroy
  end
  
private
  def find_appointment
    @appintment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :status)
  end

end
