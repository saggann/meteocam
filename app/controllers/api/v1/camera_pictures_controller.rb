class Api::V1::CameraPicturesController < ApplicationController

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

   
  # List all pictures for current device
  def index
    @camera_pictures = @device.camera_pictures
  end

  # Show picture for curent device
  def show

    @camera_picture =   @device.camera_pictures.find( params[:id])

  rescue ActiveRecord::RecordNotFound

    render json: {:message => "Picture not found", :code => 404} , :status => :not_found

    end

  # Create a picture

  def create

    #check if file is within picture_path
    if params[:picture][:picture_path]["file"]

      picture_path_params = params[:picture][:picture_path]

      #create a new tempfile named fileupload
      tempfile = Tempfile.new("fileupload")
      tempfile.binmode

      #get the file and decode it with base64 then write it to the tempfile
      tempfile.write(Base64.decode64(picture_path_params["file"]))

      #create a new uploaded file
      uploaded_file = ActionDispatch::Http::UploadedFile.new(:tempfile => tempfile, :filename => picture_path_params["filename"], :original_filename => picture_path_params["original_filename"])

      #replace picture_path with the new uploaded file
      params[:picture][:picture_path] =  uploaded_file

    end

    @camera_picture = CameraPicture.create(device: @device, timestamp: Time.now)
    @camera_picture.image = params[:picture][:picture_path]

    if @camera_picture.save

      render "show"

    else

      render json: {:message => "Can't create camera picture" + @camera_picture.errors , :code => 422} , :status => :unprocessable_entity

    end

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
