require "git"

module SourceBrowser
  class ApplicationController < ActionController::Base
    private

    def git
      @git ||= Git.open(Rails.root)
    end
  end
end
