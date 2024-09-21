Pod::Spec.new do |spec|
  spec.name          = "AwsCSdkUtils"
  spec.version       = "0.36.0"
  spec.summary       = "AWS SDK Utilities"
  spec.homepage      = "https://github.com/hassan31/aws-crt-swift"
  spec.authors       = { "Muhammad Hassan" => "info.hassan31@gmail.com" }
  spec.source        = { :git => "https://github.com/hassan31/aws-crt-swift.git", :tag => "#{spec.version}" }
  spec.platforms     = { :ios => "13.0" }
  spec.source_files  = "aws-common-runtime/aws-c-sdkutils/**/*.{h,c}"
  spec.public_header_files = "aws-common-runtime/aws-c-sdkutils/**/*.h"
  spec.dependency "AwsCCommon"
end
