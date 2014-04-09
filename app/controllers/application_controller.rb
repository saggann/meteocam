class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  before_filter :authenticate_device_from_token!

  private
  
  def record_not_found(error)
    render :json => {:error => error.message}, :status => :not_found
  end

  def authenticate_device_from_token!

    device_uid   = params[:uid].presence
    device       = device_uid && Device.find_by_uid( device_uid)

    if device && Devise.secure_compare(device.authentication_token, params[:token])
      sign_in device#, store: false
    end
    
end
 

end
