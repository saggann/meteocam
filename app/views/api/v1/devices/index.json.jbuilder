json.devices @devices do |device|

  json.extract! device, :id,  :uid

end