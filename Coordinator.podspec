Pod::Spec.new do |spec|

  spec.name                     = "Coordinator"
  spec.version                  = "0.1.0"
  spec.summary                  = "A lightweight interface of Coordinator design pattern in Swift"
  spec.description              = "A lightweight interface of Coordinator design pattern in Swift. This design pattern in iOS comes from Soroush Khanlou. See his own website to know more about it. In short, Coordinator is a flow representation of the navigation in iOS."
  spec.homepage                 = "https://github.com/MathisDetourbet/Coordinator"
  
  spec.license                  = { :type => "MIT", :file => "LICENSE" }
  spec.author                   = { "Mathis Detourbet" => "mathis.detourbet@gmail.com" }
  
  spec.platform                 = :ios
  spec.ios.deployment_target    = "13.0"
  spec.swift_versions           = "5.0"

  spec.source                   = { :git => "https://github.com/MathisDetourbet/Coordinator.git", :tag => "#{spec.version}" }

  spec.source_files             = "Coordinator/*.{swift,plist,h}"
  spec.framework                = "UIKit"
  spec.requires_arc             = true

end
