platform :ios, '8.0'

target 'Bible Reading' do
  use_frameworks!

  # Pods for Bible Reading
  pod 'ProtocolBuffers-Swift', '~> 3.0.21'
  pod 'GZIP'
  pod 'FontAwesome.swift'
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
          if ['ProtocolBuffers-Swift', 'FontAwesome.swift'].include? target.name
              target.build_configurations.each do |config|
                  config.build_settings['SWIFT_VERSION'] = '3.2'
              end
          end
      end
  end

end
