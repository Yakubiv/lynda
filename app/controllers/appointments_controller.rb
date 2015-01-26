class AppointmentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_appointment, only: [:show, :update, :edit, :destroy]

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
    @appointment.build_customer
  end

  def create
    @appointment = Appointment.create(appointment_params)
    if @appointment.save
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
    redirect_to appointments_path
  end

  private

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
      main_params = params.require(:appointment)
            .permit(:date, :status, :customer_id, :is_new_customer, service_ids:[])
      additional_params = {customer_attributes: [:first_name, :last_name, :phone]}
      if params[:appointment][:is_new_customer]
        result = main_params.merge(additional_params)
        result.permit!
      end
  end
end
