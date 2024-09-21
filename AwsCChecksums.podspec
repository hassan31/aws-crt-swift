Pod::Spec.new do |spec|
  spec.name          = "AwsCChecksums"
  spec.version       = "0.36.0"
  spec.summary       = "AWS Checksums"
  spec.homepage      = "https://github.com/hassan31/aws-crt-swift"
  spec.authors       = { "Muhammad Hassan" => "info.hassan31@gmail.com" }
  spec.source        = { :git => "https://github.com/hassan31/aws-crt-swift.git", :tag => "#{spec.version}" }
  spec.platforms     = { :ios => "13.0" }
  spec.source_files  = "aws-common-runtime/aws-checksums/**/*.{h,c}"
  spec.exclude_files = ["aws-common-runtime/aws-checksums/source/intel/visualc/*"]
  spec.public_header_files = "aws-common-runtime/aws-checksums/**/*.h"
  spec.dependency "AwsCCommon"
end
