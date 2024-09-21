Pod::Spec.new do |spec|
  spec.name          = "AwsCAuth"
  spec.version       = "0.36.0"
  spec.summary       = "AWS Common Runtime Auth Library"
  spec.homepage      = "https://github.com/hassan31/aws-crt-swift"
  spec.authors       = { "Muhammad Hassan" => "info.hassan31@gmail.com" }
  spec.source        = { :git => "https://github.com/hassan31/aws-crt-swift.git", :tag => "#{spec.version}" }
  spec.platforms     = { :ios => "13.0" }
  spec.source_files  = "aws-common-runtime/aws-c-auth/**/*.{h,c}"
  spec.public_header_files = "aws-common-runtime/aws-c-auth/**/*.h"
  spec.dependency "AwsCHttp"
  spec.dependency "AwsCCompression"
  spec.dependency "AwsCIo"
  spec.dependency "AwsCCommon"
end
