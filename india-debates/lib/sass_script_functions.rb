module Sass::Script::Functions
  def inline_image(src)
    Sass::Script::String.new("url('../images/#{src.to_s}')".to_s)
  end
end
