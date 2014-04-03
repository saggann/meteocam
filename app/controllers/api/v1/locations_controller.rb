class Api::V1::LocationsController < ApplicationController

  respond_to :json

  before_filter :set_default_response_format

  # User must be authenticated to access SHOW and INDEX method
  before_filter :authenticate_user!,    :only => [:index, :show ]

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

   
   
  def create

    @location  = Location.create(device: @device, timestamp: Time.now,  longitude: params["lon"],  latitude:  params["lat"] ,  altitude:  params["alt"]  )

    if @location.save
      render 'show'
    else
      render json: {:message => "Can't create location", :code => 422} , :status => :unprocessable_entity
    end

  end

  def index
    @locations = @device.locations
  end

  def show

    @location =   @device.locations.find( params[:id])

  rescue ActiveRecord::RecordNotFound

    render json: {:message => "Location not found", :code => 404} , :status => :not_found

    end

  private

  def set_default_response_format
    request.format = :json
  end

  # Before all, get de right device
  def get_device

    # try to find with device id
    @device   = Device.find_by id: params[:device_id]

    if !@device
      @device = Device.find_by! uid: params[:device_id]

    end

  rescue ActiveRecord::RecordNotFound

    render json: {:message => "Device not found", :code => 404} , :status => :not_found

    end

end
