module SourceBrowser
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def edit_dockerfile
        gsub_file "Dockerfile", "curl libjemalloc2", "curl git libjemalloc2"
        gsub_file "Dockerfile", "build-essential git", "build-essential"

        insert_into_file "Dockerfile", after: "USER 1000:1000\n" do
          "\nRUN git config --global --add safe.directory /rails\n"
        end
      rescue Errno::ENOENT
        puts "Skipping Dockerfile"
      end

      def edit_config_deploy_yml
        uncomment_lines "config/deploy.yml", /args:/

        insert_into_file "config/deploy.yml", after: "  args:\n" do
          "    BUILDKIT_CONTEXT_KEEP_GIT_DIR: 1\n"
        end
      rescue Errno::ENOENT
        puts "Skipping config/deploy.yml"
      end

      def edit_dockerignore
        comment_lines ".dockerignore", "/.git/"
        comment_lines ".dockerignore", "/.gitignore"
      rescue Errno::ENOENT
        puts "Skipping .dockerignore"
      end
    end
  end
end
