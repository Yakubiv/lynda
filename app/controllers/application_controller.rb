class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_admin!

  add_flash_types :error, :another_custom_type

  def after_sign_in_path_for(admin)
    appointments_path
  end
end
