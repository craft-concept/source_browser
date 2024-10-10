module SourceBrowser
  class ApplicationController < ActionController::Base
    delegate :git, to: SourceBrowser
    helper_method :git
  end
end
