Pod::Spec.new do |spec|
  spec.name          = "Elasticurl"
  spec.version       = "0.36.0"
  spec.summary       = "AWS Common Runtime Elasticurl"
  spec.description   = "Command line utility for testing AWS HTTP requests."
  spec.homepage      = "https://github.com/hassan31/aws-crt-swift"
  spec.license       = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
  spec.authors       = { "Muhammad Hassan" => "info.hassan31@gmail.com" }
  spec.source        = { :git => "https://github.com/aws/aws-crt-swift.git", :tag => "#{spec.version}" }
  spec.platforms     = { :ios => "13.0" }
  spec.swift_version = "5.0"
  
  spec.source_files  = "Source/Elasticurl/**/*.{swift,h}"

  # Dependencies
  spec.dependency "AwsCommonRuntimeKit"
end
