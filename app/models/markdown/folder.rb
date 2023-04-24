class Markdown::Folder
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
