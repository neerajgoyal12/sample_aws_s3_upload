require 'aws-sdk-core'
Rails.configuration.aws = YAML.load(ERB.new(File.read("#{Rails.root}/config/application.yml")).result)[Rails.env].symbolize_keys!
