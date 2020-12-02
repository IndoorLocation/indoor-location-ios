Pod::Spec.new do |s|
  s.name         = "IndoorLocation"
  s.version      = "1.0.6"
  s.license      = { :type => 'MIT' }
  s.summary      = "Open source framework to connect any Indoor Location technology"
  s.homepage     = "https://github.com/IndoorLocation/indoor-location-ios"
  s.author       = { "Indoor Location" => "indoorlocation@mapwize.io" }
  s.platform     = :ios
  s.ios.deployment_target = '6.0'
  s.source       = { :git => "https://github.com/IndoorLocation/indoor-location-ios.git", :tag => "#{s.version}" }
  s.source_files  = "indoor-location-ios/ILIndoorLocation/*.{h,m}"
end
