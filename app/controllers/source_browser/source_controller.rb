require "rouge"

module SourceBrowser
  class SourceController < ApplicationController
    def index
      @files = git.ls_files
    end

    def show
      @path = params[:id]
      @object = git.object(@path)
      @files = git.ls_files

      @formatter = Rouge::Formatters::HTML.new
      @formatter = Rouge::Formatters::HTMLLineTable.new(@formatter, line_id: "L%i", line_format: "<a href='?line=%i'>%i</a>")
      @lexer = Rouge::Lexer.guess(filename: @path, source: @object.contents)
      @source = @formatter.format(@lexer.lex(@object.contents))
    end
  end
end
