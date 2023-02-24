Pod::Spec.new do |spec|
  spec.name         = "UITestingPlus"
  spec.version      = "0.1.0"
  spec.summary      = "Utilities for working with XCUI testing"
  spec.swift_versions = "5.5"
  spec.description  = "Various extensions and helpers for XCUITesting."
  spec.homepage     = "https://github.com/ChimeHQ/UITestingPlus"
  spec.license      = "BSD 3-Clause"
  spec.author       = { "Matt Massicotte" => "@mattie" }

  spec.ios.deployment_target = "13.0"
  spec.osx.deployment_target = "11.0"

  spec.source       = { :git => "https://github.com/ChimeHQ/UITestingPlus.git", :tag => "#{spec.version}" }
  spec.source_files = "Sources/**/*.swift"
  spec.framework = 'XCTest'

end
