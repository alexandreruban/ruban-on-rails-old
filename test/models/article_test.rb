require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "creates articles from a folder of Markdown files" do
    folder = Rails.root.join("test/fixtures/articles")

    assert_difference "Article.count", Dir.glob("#{folder}/**/*.md").length do
      Article.create_from_folder! folder
    end
  end

  test "creates articles from Markdown file" do
    path = Rails.root.join("test/fixtures/articles/first_article.md")

    assert_difference "Article.count", 1 do
      Article.create_from_document! path
    end

    article = Article.last

    assert_equal "First meta title", article.meta_title
    assert_equal "First meta description", article.meta_description
    assert_equal "# Title\n\nContent of the first article", article.content
  end
end
