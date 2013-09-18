Pod::Spec.new do |s|
  s.name         = "COCategory"
  s.version      = "0.0.2"
  s.summary      = "Sumi Interactive make a new CoreData and iCloud a Third-party library on MagicalRecord."
  s.homepage     = "http://www.carloschen.cn"
  s.license      = 'MIT'
  s.author       = {"carlos" => "carlosk@163.com" }
  s.source       = { :git => "http://110.76.47.76:8101/iOS_COCategory.git"}
  s.source_files = '*.{h,m}'
  s.requires_arc = true
  s.platform     = :ios
end