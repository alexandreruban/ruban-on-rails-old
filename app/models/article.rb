class Article < ApplicationRecord
  DEFAULT_FOLDER = Rails.root.join("app/articles").freeze

  validates :slug, presence: true, uniqueness: true

  def self.create_from_folder(folder_or_path = DEFAULT_FOLDER)
    Markdown::Folder.wrap(folder_or_path).documents.map do |document|
      create_from_document document
    end
  end

  def self.create_from_document(document_or_path)
    upsert Markdown::Document.wrap(document_or_path).attributes, unique_by: :slug
  end
end
