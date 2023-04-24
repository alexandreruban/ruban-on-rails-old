class Markdown::Document
  def initialize(path)
    @file_content = File.read(path)
  end

  def metadata
    YAML.load(match_data[1])
  end

  def content
    match_data.post_match.strip
  end

  private

  YAML_FRONT_MATTER_REGEXP = %r!\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)!m.freeze

  attr_reader :file_content

  def match_data
    @match_data ||= YAML_FRONT_MATTER_REGEXP.match(file_content)
  end
end
