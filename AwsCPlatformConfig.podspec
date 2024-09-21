Pod::Spec.new do |spec|
  spec.name          = "AwsCPlatformConfig"
  spec.version       = "0.36.0"
  spec.summary       = "AWS Common Runtime Platform Config"
  spec.homepage      = "https://github.com/hassan31/aws-crt-swift"
  spec.authors       = { "Muhammad Hassan" => "info.hassan31@gmail.com" }
  spec.source        = { :git => "https://github.com/hassan31/aws-crt-swift.git", :tag => "#{spec.version}" }
  spec.platforms     = { :ios => "13.0" }
  spec.source_files  = "aws-common-runtime/config/**/*.{h,c}"
  spec.public_header_files = "aws-common-runtime/config/**/*.h"
  spec.module_map    = "aws-common-runtime/config/module.modulemap"
end
