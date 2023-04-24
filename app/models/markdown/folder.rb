class Markdown::Folder
  def self.wrap(folder_or_path)
    case folder_or_path
    when self then folder_or_path
    else
      new(folder_or_path)
    end
  end

  def initialize(folder)
    @folder = folder
  end

  def documents
    Dir.glob("#{folder}/**/*.md").map do |path|
      Markdown::Document.new(path)
    end
  end

  private

  attr_reader :folder
end
