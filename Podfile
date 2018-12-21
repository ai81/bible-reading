platform :ios, '8.0'

target 'Bible Reading' do
  use_frameworks!

  # Pods for Bible Reading
  pod 'SwiftProtobuf', '~> 1.0'
  pod 'GZIP'
  pod 'FontAwesome.swift', '~> 1.0.0'
  pod 'DatePickerDialog'
  pod 'InAppSettingsKit'
  pod 'Fabric'
  pod 'Crashlytics'
  
  target 'Bible ReadingTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          if ['DatePickerDialog', 'FontAwesome.swift'].include? target.name
              target.build_configurations.each do |config|
                  config.build_settings['SWIFT_VERSION'] = '3.2'
              end
          end
      end
  end

end
