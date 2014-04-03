class Api::V1::DevicesController < ApplicationController
  
 
   respond_to :json
   
   before_filter :set_default_response_format
   
   # User must be authenticated
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
   
   # Shows devices list
   def index
    @devices = Device.all
   end
   
   # Shows device info
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
