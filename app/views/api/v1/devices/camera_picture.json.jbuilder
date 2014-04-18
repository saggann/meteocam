if @camera_picture
  json.id               @camera_picture.id
  json.image_url        @camera_picture.image.url
  json.remote_image_url @camera_picture.remote_picture_url
  json.time             @camera_picture.timestamp.to_i*1000
end