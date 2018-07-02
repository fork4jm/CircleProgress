Pod::Spec.new do |s|
  s.name         = "CircleProgress"
  s.version      = "0.01"
  s.summary      = "Circle ProgressBar control for iOS."
  s.description  = <<-DESC
                   Provides wide range of customization options.
                   Supports XCode 6 live rendering feature for on-the-fly customization.
                   Has ability to animate ProgressBar's progress chage.
                   DESC
  s.homepage     = "https://github.com/fork4jm/CircleProgress"
  s.license      = 'MIT'
  s.author       = { "kot" => "dianhong.ge@jiamiantech.com" }
  s.source       = { :git => "https://github.com/fork4jm/CircleProgress.git", :tag => s.version.to_s }
  s.platforms    = { :ios => '7.0', :tvos => "9.0" }
  s.requires_arc = true
  s.source_files = 'CircleProgressBarDemo/CircleProgressBar/*'
  s.resources    = "CircleProgressBarDemo/CircleProgressBar/*.{png,bundle}"
  s.framework    = 'UIKit', 'QuartzCore'
end
