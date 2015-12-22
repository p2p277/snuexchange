CarrierWave.configure do |config|
                         
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAIZH3QPKY22OQ6IDA',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-1'                  # optional, defaults to 'us-east-1'
     }
  config.fog_directory  = 'snuexchangeventure'                          # required
end