#
# Be sure to run `pod lib lint JFFoundation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JFFoundation'
  s.version          = '0.2.1'
  s.summary          = 'Cocoa Foundation framework extension'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Cocoa Foundation framework categories wrote in Objective-C.
                       DESC

  s.homepage         = 'https://github.com/jumpingfrog0/JFFoundation'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jumpingfrog0' => 'jumpingfrog0@gmail.com' }
  s.source           = { :git => 'https://github.com/jumpingfrog0/JFFoundation.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'Source/Classes/JFFoundation.h'
  s.public_header_files = 'Source/Classes/JFFoundation.h'
  s.frameworks = 'Foundation'

  s.subspec 'Macro' do |ss|
  	ss.source_files = 'Source/Classes/Macro/*.{h,m}'
  end
  
  s.subspec 'JFBase' do |ss|
      ss.source_files = 'Source/Classes/JFBase/*.{h,m}'
  end

  s.subspec 'JFCategories' do |ss|
  	ss.source_files = 'Source/Classes/JFCategories/*/*.{h,m}'
    ss.dependency 'JFFoundation/JFBase'
  end

end
