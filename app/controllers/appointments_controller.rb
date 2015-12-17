class AppointmentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_appointment, only: [:show, :edit, :update, :destroy]


  def index
    @header = 'Pending'
    @appointments = Appointment.pending.paginate(page: params[:page], per_page: 12)
  end

  def completed
    @header = 'Completed'
    @appointments = Appointment.completed.paginate(page: params[:page], per_page: 12)
    render :index
  end

  def canceled
    @header = 'Canceled'
    @appointments = Appointment.canceled.paginate(page: params[:page], per_page: 12)
    render :index
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
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointments_path
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  def keen_params
   { request: {
       ip: request.ip },
     appoinment: {
       status: 'pending' } }
  end

  def perform_tracking
   http = Keen.publish_async('appointments', keen_params)
   http.callback { |response| puts "Success: #{response}"}
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
      [customer_attributes: [:first_name, :last_name, :phone, :email, :avatar, :bio]]
    else
      [:customer_id]
    end
  end
end
