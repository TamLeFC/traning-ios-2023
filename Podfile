# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ReviewProject' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ReviewProject

  #rx
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxSwiftExt'
  pod 'RxDataSources'

  #realm
  pod 'RealmSwift'
  pod 'RxRealm'

  #api request
  pod 'Alamofire'
  pod 'RxAlamofire'
  pod 'Moya/RxSwift'
  
  #convert json object
  pod 'ObjectMapper'
  
  pod 'Kingfisher'
  
  post_install do |pi|
      pi.pods_project.targets.each do |t|
          t.build_configurations.each do |config|
              config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
          end
      end
  end

end
