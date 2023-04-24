require "test_helper"

class Markdown::DocumentTest < ActiveSupport::TestCase
  setup do
    @document = Markdown::Document.new(Rails.root.join("test/fixtures/articles/first_article.md"))
  end

  test "parses the attributes" do
    assert_equal "First meta title", @document.attributes["meta_title"]
    assert_equal "First meta description", @document.attributes["meta_description"]
    assert_equal "# Title\n\nContent of the first article", @document.attributes["content"]
  end

  test "parses the metadata" do
    assert_equal "First meta title", @document.metadata["meta_title"]
    assert_equal "First meta description", @document.metadata["meta_description"]
  end

  test "parses the content" do
    assert_equal "# Title\n\nContent of the first article", @document.content
  end
end
