CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'                        # required
    config.fog_credentials = {
      provider:              'AWS', 
      region:                'eu-central-1',                         # required
      aws_access_key_id:     Rails.application.credentials[Rails.env.to_sym][:aws_key],                        # required
      aws_secret_access_key: Rails.application.credentials[Rails.env.to_sym][:aws_secret],                        # required
    }
    config.fog_directory  = Rails.application.credentials[Rails.env.to_sym][:aws_bucket]                         # required
  end