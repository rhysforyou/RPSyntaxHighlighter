Pod::Spec.new do |s|
  s.name         = "RPSyntaxHighlighter"
  s.version      = "0.0.1"
  s.summary      = "A regexp-powered, NSAttributedString-backed syntax highlighting library for iOS."

  s.description  = <<-DESC
                   RPSyntaxHighlighter is a easy to use, fully extensible syntax highlighting library for iOS. It was built with a few ideas in mind:

                   1. Ease of use: it should be easy to highlight and process code in your app. This is why we use NSAttributedString objects which can be displayed in most UIKit controls as of iOS 6.
                   2. Extensibility: The language definitions and themes used by RPSyntaxHighlighter are simple JSON files. This means it's easy to add extra languages or design a theme that matches your app.
                   3. Simplicity: The entire RPSyntaxHighlighter codebase consists of three classes, meaning it's easy to understand what's going on. It's also fully documented with appledoc.
                   DESC

  s.homepage     = "https://github.com/rpowelll/RPSyntaxHighlighter"
  s.screenshots  = "https://raw.github.com/rpowelll/RPSyntaxHighlighter/master/Media/screenshot.png"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "rpowelll" => "rhys@rpowell.me" }
  s.platform     = :ios, '6.0'
  s.source       = { :git => "https://github.com/rpowelll/RPSyntaxHighlighter.git", :tag => "0.0.1" }
  s.source_files  = 'RPSyntaxHighlighter/'
  s.exclude_files = 'Classes/'
  s.resources  = 'Language Definitions/*.json', 'Themes/*.json'
  s.frameworks = 'UIKit', 'Foundation'
  s.requires_arc = true
end
