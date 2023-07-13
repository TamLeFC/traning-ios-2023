# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Course6' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Course6
#rx
  pod 'RxSwift', '6.5.0'
  pod 'RxCocoa', '6.5.0'
  pod 'RxSwiftExt', '6.0.1'
  pod 'RxDataSources', '5.0.0'
  
  #api request
  pod 'Alamofire', '~> 5.4.4'
  pod 'RxAlamofire', '~> 6.1.1'
  pod 'Moya/RxSwift', '~> 15.0.0'
  
  #convert json object
  pod 'ObjectMapper', '~> 4.2.0'
  
  pod 'Kingfisher', '~> 6.3.1'
  
  post_install do |pi|
      pi.pods_project.targets.each do |t|
          t.build_configurations.each do |config|
              config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
          end
      end
  end
end
