require "test_helper"

class Markdown::FolderTest < ActiveSupport::TestCase
  setup do
    @folder = Markdown::Folder.new(folder_path)
  end

  test "returns all documents in a folder" do
    assert @folder.documents.all? { |document| document.is_a?(Markdown::Document) }
    assert_equal Dir.glob("#{folder_path}/**/*.md").length, @folder.documents.size
  end

  private

  def folder_path
    Rails.root.join("test/fixtures/articles")
  end
end
