require "json"
class Quote < Liquid::Block

  def initialize(tagName, markup, tokens)
    super

    @x=JSON.parse markup
  end

  def render(context)
    " <figure class=\"quote\">
        <blockquote>#{super}</blockquote>
        <figcaption>
         <span class=\"person\">#{@x["person"]}</span>,
         <cite>#{@x["source"]}</cite>
         <span class=\"date\">(#{@x["date"]})</span>
        </figcaption>
      </figure>"
  end

  Liquid::Template.register_tag "quote", self
end
