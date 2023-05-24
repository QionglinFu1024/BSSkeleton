# Uncomment the next line to define a global platform for your project
 platform :ios, '13.0'

target 'BSSkeleton' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for BSSkeleton

pod 'Masonry'

end


post_install do |installer|
  
  # fix Missing file libarclite_iphoneos.a (Xcode 14.3)
  # https://stackoverflow.com/questions/75574268/missing-file-libarclite-iphoneos-a-xcode-14-3
  installer.generated_projects.each do |project|
            project.targets.each do |target|
                target.build_configurations.each do |config|
                    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
                 end
            end
     end

end

