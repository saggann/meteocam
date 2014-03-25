class Location < ActiveRecord::Base
  
  belongs_to :device
  
  validates :device_id, presence: true
  validate  :timestamp,  presence: true
  
  
  
  
end
