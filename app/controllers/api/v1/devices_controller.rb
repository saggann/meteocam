require 'pp'

class Api::V1::DevicesController < ApplicationController
  
 
   respond_to :json
   
   before_filter :set_default_response_format
   
   # User must be authenticated :  current_user 
   before_filter :authenticate_user! # For all methods
  
   
   def new  
     render json: {:message => "Method not allowed", :code => 405} , :status =>    :method_not_allowed
   end
   
   def update
     render json: {:message => "Method not allowed", :code => 405} , :status =>    :method_not_allowed
   end
   
   def edit  
     render json: {:message => "Method not allowed", :code => 405} , :status =>    :method_not_allowed
   end
   
   def destroy  
     render json: {:message => "Method not allowed", :code => 405} , :status =>    :method_not_allowed
   end
   
   def create
     render json: {:message => "Method not allowed", :code => 405} , :status =>    :method_not_allowed
   end
   
   # Shows user's devices list
   def index
    @devices = current_user.devices
   end
   
   # Shows users following the device
   def following
     @devices = current_user.followed_devices
   end
   
   # Get the camera picture of the device
   def camera_picture
     
       # Try to the device with its id or uid
       @device   = get_device params[:device_id]
       
       if @device
          # Render camera_picture  json, if user is allowed
          if @device.get_read_access(current_user)
                  @camera_picture = @device.camera_picture
              
          else
                  render json: {:message => "Not authorized to read device camera picture", :code => 401} , :status => :unauthorized 
          end
            
       end
   end

   # Get the location of the device
   def location
     
       # Try to the device with its id or uid
       @device   = get_device params[:device_id]
       
       if @device
          # Render Location to json, if user is allowed
          if @device.get_read_access(current_user)
                  @location = @device.location
              
          else
                  render json: {:message => "Not authorized to read device location", :code => 401} , :status => :unauthorized 
          end
            
       end
                 
   end
   
   # Shows device 
   def show
       
       # Try to the device with its id or uid
       @device   = get_device params[:id]

       if @device
        # Render Device to json, if user is allowed
        render json: {:message => "Not authorized to read device information", :code => 401} , :status => :unauthorized unless @device.get_read_access(current_user)
       else
        render json: {:message => "Device not found", :code => 404} , :status => :not_found
       end
         
  end

  
  private
  
  # Try to get device from its id or uid. Render json error if not found
  def get_device( id_or_uid)
        
       # try to find with device id
       @device   = Device.where("id = ? OR uid= ?", id_or_uid, id_or_uid).take
     
                
       rescue ActiveRecord::RecordNotFound
          render json: {:message => "Device not found", :code => 404} , :status => :not_found
          return false
    
  end
  
  # Set the default response format to json 
  def set_default_response_format
    request.format = :json
  end
  
  

  
end
