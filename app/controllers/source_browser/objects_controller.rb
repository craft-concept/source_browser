module SourceBrowser
  class ObjectsController < ApplicationController
    def show
      @path = params[:id]
      @object = git.object(@path)
      render body: @object.contents
    end
  end
end
