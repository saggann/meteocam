
json.array! @camera_pictures do |camera_picture|

 json.partial! 'camera_picture', camera_picture: camera_picture

end
