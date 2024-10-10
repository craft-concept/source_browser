require "source_browser/version"
require "source_browser/engine"
require "git"

module SourceBrowser
  # Your code goes here...
  def self.git
    @git ||= Git.open(Rails.root)
  end
end
