class Markdown::Document
  def self.wrap(document_or_path)
    case document_or_path
    when self then document_or_path
    else
      new(document_or_path)
    end
  end

  def initialize(path)
    @raw_content = File.read(path)
  end

  def attributes
    metadata.merge(content: content).with_indifferent_access
  end

  def metadata
    YAML.load(match_data[1])
  end

  def content
    match_data.post_match.strip
  end

  private

  YAML_FRONT_MATTER_REGEXP = %r!\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)!m.freeze

  attr_reader :raw_content

  def match_data
    @match_data ||= YAML_FRONT_MATTER_REGEXP.match(raw_content)
  end
end
