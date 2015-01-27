class AppointmentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_appointment, only: [:show, :update, :edit, :destroy]

  def index
    @appointments = Appointment.all.paginate(page: params[:page], per_page: 12).where(status: 'pending')
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
    redirect_to appointments_path
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
    params.require(:appointment)
          .permit(appointment_keys.push(customer_keys))
  end

  def appointment_keys
    [:date, :status, :is_new_customer, service_ids:[]]
  end

  def customer_keys
    if params[:appointment][:is_new_customer] == 'true'
      [customer_attributes: [:first_name, :last_name, :phone]]
    else
      [:customer_id]
    end
  end
end
