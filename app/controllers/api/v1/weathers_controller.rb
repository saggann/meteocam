class Api::V1::WeathersController < ApplicationController
  
 
   respond_to :json
   before_filter :set_default_response_format

  
   def new
     
   end
      
   def create 
     
   end
   
   def update
     
   end 
   
   def edit

   end 
   
   def destroy
     
   end 
   
 
   
   def index
     @device   = Device.find(params[:device_id])
     @weathers = @device.weathers
   end
   
   
   def show
     

         
         
  end

  
  private
  def set_default_response_format
    request.format = :json
  end
  
  
end
