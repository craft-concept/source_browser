# SourceBrowser
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "source_browser"
```

And then execute:
```bash
$ bundle
```

Mount the engine in your `config/routes.rb`
```rb
mount SourceBrowser::Engine, at: "/source"
```

If you're using the default rails `Dockerfile`, make these changes:

```diff
diff --git a/Dockerfile b/Dockerfile
index dcc10c2..790ea2e 100644
--- a/Dockerfile
+++ b/Dockerfile
@@ -16,7 +16,7 @@ WORKDIR /rails
 
 # Install base packages
 RUN apt-get update -qq && \
-    apt-get install --no-install-recommends -y curl libjemalloc2 libvips sqlite3 && \
+    apt-get install --no-install-recommends -y curl git libjemalloc2 libvips sqlite3 && \
     rm -rf /var/lib/apt/lists /var/cache/apt/archives
 
 # Set production environment
@@ -30,7 +30,7 @@ FROM base AS build
 
 # Install packages needed to build gems
 RUN apt-get update -qq && \
-    apt-get install --no-install-recommends -y build-essential git pkg-config && \
+    apt-get install --no-install-recommends -y build-essential pkg-config && \
     rm -rf /var/lib/apt/lists /var/cache/apt/archives
 
 # Install application gems
@@ -58,12 +58,15 @@ FROM base
 COPY --from=build "${BUNDLE_PATH}" "${BUNDLE_PATH}"
 COPY --from=build /rails /rails
 
+
 # Run and own only the runtime files as a non-root user for security
 RUN groupadd --system --gid 1000 rails && \
     useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash && \
     chown -R rails:rails db log storage tmp
 USER 1000:1000
 
+RUN git config --global --add safe.directory /rails
+
 # Entrypoint prepares the database.
 ENTRYPOINT ["/rails/bin/docker-entrypoint"]
```

```diff
diff --git a/.dockerignore b/.dockerignore
index 7540593..f48e52c 100644
--- a/.dockerignore
+++ b/.dockerignore
@@ -1,9 +1,5 @@
 # See https://docs.docker.com/engine/reference/builder/#dockerignore-file for more about ignoring files.
 
-# Ignore git directory.
-/.git/
-/.gitignore
-
 # Ignore bundler config.
 /.bundle
```

And if you're using [kamal](https://kamal-deploy.org/) for deploys, change
`config/deploy.yml`:

```diff
diff --git a/config/deploy.yml b/config/deploy.yml
index 2147327..35f225e 100644
--- a/config/deploy.yml
+++ b/config/deploy.yml
@@ -76,8 +76,9 @@ builder:
   # remote: ssh://docker@docker-builder-server
   #
   # # Pass arguments and secrets to the Docker build process
-  # args:
-  #   RUBY_VERSION: ruby-3.3.5
+  args:
+    BUILDKIT_CONTEXT_KEEP_GIT_DIR: 1
+    # RUBY_VERSION: ruby-3.3.5
   # secrets:
   #   - GITHUB_TOKEN
   #   - RAILS_MASTER_KEY
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
