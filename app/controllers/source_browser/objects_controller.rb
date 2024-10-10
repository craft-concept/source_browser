module SourceBrowser
  class ObjectsController < ApplicationController
    def show
      @object = git.object(params[:id])
      render body: @object.contents
    end
  end
end
