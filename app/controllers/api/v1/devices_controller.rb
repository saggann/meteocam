class Api::V1::DevicesController < ApplicationController
  
 
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
    @devices = Device.all
   end
   
   
   def show
     
       # try to find with device id
       @device   = Device.find_by id: params[:id]
       
       if !@device
         @device = Device.find_by! uid: params[:id]
       
       end

       rescue ActiveRecord::RecordNotFound
         
         render json: {:message => "Device not found", :code => 404} , :status => :not_found
         
         
  end

  
  private
  def set_default_response_format
    request.format = :json
  end
  
  
end
