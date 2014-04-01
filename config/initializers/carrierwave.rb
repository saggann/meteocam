
require 'rails/all'

require 'carrierwave'

require 'fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider                         => 'Google',
    :google_storage_access_key_id     => 'GOOGFEZN4QWMGLHHQ654',
    :google_storage_secret_access_key => 'uRNH/YYy3JPVesZTIi1HciauMyye1NPvDpw2+zxM'
  }
  config.fog_directory = 'meteocam'
end