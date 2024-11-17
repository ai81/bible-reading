platform :ios, '15.6'
inhibit_all_warnings!

target 'Bible Reading' do
  use_frameworks!

  # Pods for Bible Reading
  pod 'SwiftProtobuf', '~> 1.0'
  pod 'GZIP'
  pod 'FontAwesome.swift'
  pod 'DatePickerDialog'
  pod 'InAppSettingsKit'
  
  target 'Bible ReadingTests' do
    inherit! :search_paths
    # Pods for testing
  end
end

# To fix bug with SDK does not contain 'libarclite' at the path (https://stackoverflow.com/questions/77139617/clang-error-sdk-does-not-contain-libarclite-at-the-path)
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["IPHONEOS_DEPLOYMENT_TARGET"] = "15.6"
    end
  end
end
