require "json"
class Quote < Liquid::Block

  def initialize(tagName, markup, tokens)
    super
    
    if markup.to_s == ''
      markup = "{\"dummy\":\"\"}"#I don't like this at all!
    end
    @x = JSON.parse markup
  end

  def render(context)
    person = "<span class=\"person\">#{@x["person"]}</span>" if @x["person"]
    source = ", <cite>#{@x["source"]}</cite>"                if @x["source"]
    date   = " <span class=\"date\">(#{@x["date"]})</span>"  if @x["date"]

    quote_markup = "<figure class=\"quote\">"            +
                   "  <blockquote>#{super}</blockquote>" +
                   "  <figcaption>"                      +
                   "    #{person}#{source}#{date}"       +
                   "  </figcaption>"                     +
                   "</figure>"

    return quote_markup
  end

  Liquid::Template.register_tag "quote", self
end
