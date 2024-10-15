require_relative "lib/source_browser/version"

Gem::Specification.new do |spec|
  spec.name        = "source_browser"
  spec.version     = SourceBrowser::VERSION
  spec.authors     = ["Jeff Peterson", "Matt Tognetti"]
  spec.email       = ["jeff@concept.love", "matt@concept.love"]
  spec.homepage    = "https://github.com/craft-concept/source_browser"
  spec.summary     = "Rails plugin for browsing source code"
  spec.description = "SourceBrowser is a Rails engine for browsing source code. It is designed to be used in a Rails application that is serving web pages to users."
  spec.license     = "MIT"

  # spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/craft-concept/source_browser"
  spec.metadata["changelog_uri"] = "https://github.com/craft-concept/source_browser/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.required_ruby_version = ">= 3.0.0"

  spec.add_dependency "rails", "~> 8.0.0.beta1"
  spec.add_dependency "git", "~> 2.3.0"
  spec.add_dependency "rouge", "~> 4.4.0"
end
