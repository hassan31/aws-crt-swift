
Pod::Spec.new do |spec|
  spec.name          = "AwsCommonRuntimeKit"
  spec.version       = "0.36.0"
  spec.summary       = "AWS CRT Swift is a Swift wrapper for the AWS Common Runtime."
  spec.description   = "This is a Swift library wrapping the AWS Common Runtime, including AWS SDK utility, AWS HTTP, and cryptographic libraries."
  spec.homepage      = "https://github.com/hassan31/aws-crt-swift"
  spec.license       = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
  spec.authors       = { "Muhammad Hassan" => "info.hassan31@gmail.com" }
#  spec.source        = { :git => "https://github.com/aws/aws-crt-swift.git", :tag => "#{spec.version}" }
  spec.source        = { :git => "https://github.com/hassan31/aws-crt-swift.git", :branch => "main" }

  spec.platforms     = { :ios => "13.0", :osx => "10.15", :tvos => "13.0", :watchos => "6.0" }
  spec.swift_version = "5.0"

  # Define the base source files and exclude unnecessary ones
  spec.source_files = "Source/AwsCommonRuntimeKit/**/*.{swift,h,m}"
  spec.exclude_files = [
    tests cmake CONTRIBUTING.md LICENSE format-check.py NOTICE builder.json CMakeLists.txt README.md
  ]

  # Resources for the main target
  spec.resources = ["Source/AwsCommonRuntimeKit/PrivacyInfo.xcprivacy"]

  # Pod Target settings
  spec.pod_target_xcconfig = {
    "HEADER_SEARCH_PATHS" => "aws-common-runtime/**",
    "OTHER_SWIFT_FLAGS"   => "-DAWS_APPSTORE_SAFE -DDEBUG_BUILD"
  }
  
  # AwsCPlatformConfig target
  spec.subspec "AwsCPlatformConfig" do |subspec|
    subspec.source_files = "aws-common-runtime/config/**/*.{h,c}"
    subspec.public_header_files = "aws-common-runtime/config/**/*.h"
  end

  # AwsCCommon target
  spec.subspec "AwsCCommon" do |subspec|
    subspec.source_files = "aws-common-runtime/aws-c-common/**/*.{h,c}"
    subspec.exclude_files = ["aws-common-runtime/aws-c-common/source/arch/intel/*", "aws-common-runtime/aws-c-common/source/arch/arm/*"]
    subspec.public_header_files = "aws-common-runtime/aws-c-common/**/*.h"
    subspec.dependency "AwsCommonRuntimeKit/AwsCPlatformConfig"
  end

  # AwsCSdkUtils target
  spec.subspec "AwsCSdkUtils" do |subspec|
    subspec.source_files = "aws-common-runtime/aws-c-sdkutils/**/*.{h,c}"
    subspec.public_header_files = "aws-common-runtime/aws-c-sdkutils/**/*.h"
    subspec.dependency "AwsCommonRuntimeKit/AwsCCommon"
  end

  # AwsCCal target
  spec.subspec "AwsCCal" do |subspec|
    subspec.source_files = "aws-common-runtime/aws-c-cal/**/*.{h,c}"
    subspec.exclude_files = ["aws-common-runtime/aws-c-cal/bin/**/*"]
    subspec.public_header_files = "aws-common-runtime/aws-c-cal/**/*.h"
    subspec.dependency "AwsCommonRuntimeKit/AwsCCommon"
  end

  # AwsCIo target
  spec.subspec "AwsCIo" do |subspec|
    subspec.source_files = "aws-common-runtime/aws-c-io/**/*.{h,c}"
    subspec.exclude_files = ["aws-common-runtime/aws-c-io/source/s2n/*"]
    subspec.public_header_files = "aws-common-runtime/aws-c-io/**/*.h"
    subspec.dependency "AwsCommonRuntimeKit/AwsCCommon"
    subspec.dependency "AwsCommonRuntimeKit/AwsCCal"
  end

  # AwsCCompression target
  spec.subspec "AwsCCompression" do |subspec|
    subspec.source_files = "aws-common-runtime/aws-c-compression/**/*.{h,c}"
    subspec.public_header_files = "aws-common-runtime/aws-c-compression/**/*.h"
    subspec.dependency "AwsCommonRuntimeKit/AwsCCommon"
  end

  # AwsCHttp target
  spec.subspec "AwsCHttp" do |subspec|
    subspec.source_files = "aws-common-runtime/aws-c-http/**/*.{h,c}"
    subspec.public_header_files = "aws-common-runtime/aws-c-http/**/*.h"
    subspec.dependency "AwsCommonRuntimeKit/AwsCCommon"
    subspec.dependency "AwsCommonRuntimeKit/AwsCIo"
    subspec.dependency "AwsCommonRuntimeKit/AwsCCompression"
  end

  # AwsCAuth target
  spec.subspec "AwsCAuth" do |subspec|
    subspec.source_files = "aws-common-runtime/aws-c-auth/**/*.{h,c}"
    subspec.public_header_files = "aws-common-runtime/aws-c-auth/**/*.h"
    subspec.dependency "AwsCommonRuntimeKit/AwsCHttp"
    subspec.dependency "AwsCommonRuntimeKit/AwsCCompression"
    subspec.dependency "AwsCommonRuntimeKit/AwsCIo"
    subspec.dependency "AwsCommonRuntimeKit/AwsCCommon"
  end

  # AwsCChecksums target
  spec.subspec "AwsCChecksums" do |subspec|
    subspec.source_files = "aws-common-runtime/aws-checksums/**/*.{h,c}"
    subspec.exclude_files = ["aws-common-runtime/aws-checksums/source/intel/visualc/*"]
    subspec.public_header_files = "aws-common-runtime/aws-checksums/**/*.h"
    subspec.dependency "AwsCommonRuntimeKit/AwsCCommon"
  end

  # AwsCEventStream target
  spec.subspec "AwsCEventStream" do |subspec|
    subspec.source_files = "aws-common-runtime/aws-c-event-stream/**/*.{h,c}"
    subspec.public_header_files = "aws-common-runtime/aws-c-event-stream/**/*.h"
    subspec.dependency "AwsCommonRuntimeKit/AwsCChecksums"
    subspec.dependency "AwsCommonRuntimeKit/AwsCCommon"
    subspec.dependency "AwsCommonRuntimeKit/AwsCIo"
    subspec.dependency "AwsCommonRuntimeKit/AwsCCal"
  end

  # Main target AwsCommonRuntimeKit
  spec.subspec "AwsCommonRuntimeKit" do |subspec|
    subspec.source_files = "Source/AwsCommonRuntimeKit/**/*.{swift,h}"
    subspec.resources = ["Source/AwsCommonRuntimeKit/PrivacyInfo.xcprivacy"]
    subspec.dependency "AwsCommonRuntimeKit/AwsCAuth"
    subspec.dependency "AwsCommonRuntimeKit/AwsCHttp"
    subspec.dependency "AwsCommonRuntimeKit/AwsCCal"
    subspec.dependency "AwsCommonRuntimeKit/AwsCCompression"
    subspec.dependency "AwsCommonRuntimeKit/AwsCIo"
    subspec.dependency "AwsCommonRuntimeKit/AwsCCommon"
    subspec.dependency "AwsCommonRuntimeKit/AwsCChecksums"
    subspec.dependency "AwsCommonRuntimeKit/AwsCEventStream"
  end

  # Test target AwsCommonRuntimeKitTests
  spec.test_spec "AwsCommonRuntimeKitTests" do |test_spec|
    test_spec.source_files = "Test/AwsCommonRuntimeKitTests/**/*.{swift,h}"
    test_spec.resources = ["Test/AwsCommonRuntimeKitTests/Resources/*"]
    test_spec.dependency "AwsCommonRuntimeKit/AwsCommonRuntimeKit"
  end

  # Executable target Elasticurl
  spec.subspec "Elasticurl" do |subspec|
    subspec.source_files = "Source/Elasticurl/**/*.{swift,h}"
    subspec.dependency "AwsCommonRuntimeKit/AwsCommonRuntimeKit"
  end
end
