module SvgHelper
  def inline_svg(path, **options)
    File.read("#{Rails.root}/app/assets/images/#{path}.svg").strip.then do |icon|
      raw options.any? ? icon.sub(/\A<svg(.*?)>/, "<svg\\1 #{tag.attributes(**options)}>") : icon
    end
  end
end
