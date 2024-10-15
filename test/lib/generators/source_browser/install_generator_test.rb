require "test_helper"
require "generators/source_browser/install/install_generator"

module SourceBrowser
  class InstallGeneratorTest < Rails::Generators::TestCase
    tests SourceBrowser::Generators::InstallGenerator
    destination Rails.root.join("tmp/generators")
    setup :prepare_destination

    test "generator runs without errors" do
      assert_nothing_raised do
        run_generator []
      end
    end
  end
end
