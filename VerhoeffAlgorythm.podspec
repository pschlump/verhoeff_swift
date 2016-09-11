Pod::Spec.new do |s|
  s.name             = "VerhoeffAlgorithm"
  s.version          = "0.1.0"
  s.summary          = "A Verhoeff Checksum for Swift"

  s.description      = <<-DESC
                        Implements the Verhoeff checksum in Swift
                       DESC

  s.homepage         = "https://github.com/pschlump/verhoeff_swift"
  s.license          = 'MIT'
  s.author           = { "Philip Schlump" => "pschlump@gmail.com" }
  s.source           = { :git => "https://github.com/pschlump/verhoeff_swift.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/pschlump'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
end
