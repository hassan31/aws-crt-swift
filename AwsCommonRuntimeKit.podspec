Pod::Spec.new do |spec|
  spec.name          = "AwsCommonRuntimeKit"
  spec.version       = "0.36.0"
  spec.summary       = "AWS Common Runtime Kit for Swift"
  spec.description   = "Swift wrapper for the AWS Common Runtime."
  spec.homepage      = "https://github.com/hassan31/aws-crt-swift"
  spec.license       = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
  spec.authors       = { "Muhammad Hassan" => "info.hassan31@gmail.com" }
  spec.source        = { :git => "https://github.com/aws/aws-crt-swift.git", :tag => "#{spec.version}" }
  spec.platforms     = { :ios => "13.0" }
  spec.swift_version = "5.0"
  
  spec.source_files  = "Source/AwsCommonRuntimeKit/**/*.{swift,h}"
  spec.resources     = ["Source/AwsCommonRuntimeKit/PrivacyInfo.xcprivacy"]

  # Dependencies
  spec.dependency "AwsCAuth"
  spec.dependency "AwsCHttp"
  spec.dependency "AwsCCal"
  spec.dependency "AwsCCompression"
  spec.dependency "AwsCIo"
  spec.dependency "AwsCCommon"
  spec.dependency "AwsCChecksums"
  spec.dependency "AwsCEventStream"
end
