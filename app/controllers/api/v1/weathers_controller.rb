class Api::V1::WeathersController < ApplicationController

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

    @weather  = Weather.create(device: @device, timestamp: Time.now, temperature: params["temp"], pressure: params["pressure"] )

    if @weather.save
     render json: {:message => "Weather created", :code => 201} , :status => :created
    else
      render json: {:message => "Can't create weather", :code => 422} , :status => :unprocessable_entity
    end

  end


  def index
    if ['hour', 'day', 'week', 'month'].include?  params[:range]
      range = params[:range]
    else
      range = "day"
    end
    @weathers = @device.weathers.where(timestamp: (  1.send(range).ago)..Time.now)
  end



  def show

    @weather =   @device.weathers.find( params[:id])

  rescue ActiveRecord::RecordNotFound

    render json: {:message => "Weather not found", :code => 404} , :status => :not_found

    end





  private

  def set_default_response_format
    request.format = :json
  end

  def get_device

    # try to find with device id
    @device   = Device.find_by id: params[:device_id]

    if !@device
      @device = Device.find_by! uid: params[:device_id]

    end

    # if not found, try device uid

  rescue ActiveRecord::RecordNotFound
    render json: {:message => "Device not found", :code => 404} , :status => :not_found

    end

end
