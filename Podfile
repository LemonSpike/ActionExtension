# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'ActionExtensionDemo' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ActionExtensionDemo

end

target 'EnlargeExtension' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for EnlargeExtension
  pod 'Alamofire', :git => 'https://github.com/Alamofire/Alamofire'
  
  post_install do |installer|
      `find Pods -regex 'Pods/pop.*\\.h' -print0 | xargs -0 sed -i '' 's/\\(<\\)pop\\/\\(.*\\)\\(>\\)/\\"\\2\\"/'`
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['SWIFT_VERSION'] = '3.0'
          end
      end
  end

end
