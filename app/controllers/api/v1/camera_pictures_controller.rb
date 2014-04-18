class Api::V1::CameraPicturesController < ApplicationController

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
    @device.camera_picture = @camera_picture

    if @device.save

       render json: {:message => "Picture saved", :code => 201} , :status => :created

    else

      render json: {:message => "Can't create camera picture" + @device.errors , :code => 422} , :status => :unprocessable_entity

    end

  end

  private

  def set_default_response_format
    request.format = :json
  end

  # Before all, get de right device
  
  # Try to get device from its id or uid. Render json error if not found
  def get_device
       
       id_or_uid = params[:device_id]
       
       # try to find with device id
       @device   = Device.where("id = ? OR uid= ?", id_or_uid, id_or_uid).take
     
                
       rescue ActiveRecord::RecordNotFound
          render json: {:message => "Device not found", :code => 404} , :status => :not_found
          return false
    
  end
  
end
