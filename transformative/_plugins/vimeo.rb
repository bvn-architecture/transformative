class Vimeo < Liquid::Tag
  Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

  def initialize(tagName, markup, tokens)
    super

    if markup =~ Syntax then
      @id = $1
    else
      raise "No Vimeo ID provided in the \"vimeo\" tag"
    end
  end

  def render(context)
    "<div class=\"embed-responsive embed-responsive-4by3\">
    <iframe class=\"embed-responsive-item\" src=\"https://player.vimeo.com/video/#{@id}\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
    </div>"
  end

  Liquid::Template.register_tag "vimeo", self
end
