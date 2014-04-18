class Api::V1::LocationsController < ApplicationController

  respond_to :json

  before_filter :set_default_response_format


  # Device must be authenticated to access CREATE
  before_filter :authenticate_device!,  :only =>[:create]
  before_filter :get_device


  skip_before_filter  :verify_authenticity_token
  
  
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

   def index
    render json: {:message => "Method not allowed", :code => 405} , :status =>    :method_not_allowed
   end

   def show
    render json: {:message => "Method not allowed", :code => 405} , :status =>    :method_not_allowed
   end  
   
  def create

    @device.location  = Location.create(device: @device, timestamp: Time.now,  longitude: params["lon"],  latitude:  params["lat"] ,  altitude:  params["alt"]  )

    if @device.save
      render json: {:message => "Location saved", :code => 201} , :status => :created
    else
      render json: {:message => "Can't create location", :code => 422} , :status => :unprocessable_entity
    end

  end



  private

  def set_default_response_format
    request.format = :json
  end

  # Before all, get de right device
  # Try to get device from its id or uid. Render json error if not found
  def get_device
        
       # try to find with device id
       @device   = Device.where("id = ? OR uid= ?", params[:device_id], params[:device_id]).take
     
                
       rescue ActiveRecord::RecordNotFound
          render json: {:message => "Device not found", :code => 404} , :status => :not_found
          return false
    
  end



end
