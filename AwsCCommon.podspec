Pod::Spec.new do |spec|
  spec.name          = "AwsCCommon"
  spec.version       = "0.36.0"
  spec.summary       = "AWS Common Runtime C Library"
  spec.homepage      = "https://github.com/hassan31/aws-crt-swift"
  spec.authors       = { "Muhammad Hassan" => "info.hassan31@gmail.com" }
  spec.source        = { :git => "https://github.com/hassan31/aws-crt-swift.git", :tag => "#{spec.version}" }
  spec.platforms     = { :ios => "13.0" }
  spec.source_files  = "aws-common-runtime/aws-c-common/**/*.{h,c}"
  spec.exclude_files = ["aws-common-runtime/aws-c-common/source/arch/intel/*", "aws-common-runtime/aws-c-common/source/arch/arm/*"]
  spec.public_header_files = "aws-common-runtime/aws-c-common/**/*.h"
  spec.dependency "AwsCPlatformConfig"
end
