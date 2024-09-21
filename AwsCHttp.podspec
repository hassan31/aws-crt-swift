Pod::Spec.new do |spec|
  spec.name          = "AwsCHttp"
  spec.version       = "0.36.0"
  spec.summary       = "AWS Common Runtime HTTP Library"
  spec.homepage      = "https://github.com/hassan31/aws-crt-swift"
  spec.authors       = { "Muhammad Hassan" => "info.hassan31@gmail.com" }
  spec.source        = { :git => "https://github.com/hassan31/aws-crt-swift.git", :tag => "#{spec.version}" }
  spec.platforms     = { :ios => "13.0" }
  spec.source_files  = "aws-common-runtime/aws-c-http/**/*.{h,c}"
  spec.public_header_files = "aws-common-runtime/aws-c-http/**/*.h"
  spec.dependency "AwsCCommon"
  spec.dependency "AwsCIo"
  spec.dependency "AwsCCompression"
end
