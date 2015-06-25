require "json"
class Gallery < Liquid::Block

  def initialize(tagName, markup, tokens)
    super

    if markup.to_s == ''
      markup = "{\"dummy\":\"\"}"#I don't like this at all!
    end
    @x = JSON.parse markup
  end

  def render(context)
    # person = "<span class=\"person\">#{@x["person"]}</span>" if @x["person"]
    newpics = []
    "#{super}".split("<picture>").each {|pic| newpics.push("<picture>"<<pic)}

    gallery_markup ="" +
"<div id='gallery' class='carousel slide' data-ride='carousel'>
<!--indicators were in here-->
  <div class='carousel-inner' role='listbox'>"

    flag = true
    newpics.each {|picture_element|
      unless picture_element.strip.length < 10 #catches blank lines. An opening picture tag is 9 chars long.
        if flag
          flag = false
          gallery_markup << "<div class='item active'>"+picture_element+"</div>"
        else
          gallery_markup << "<div class='item'>"+picture_element+"</div>"
        end
      end
    }

    gallery_markup << "" +
"  </div><!-- carousel-inner -->
<!-- Controls -->
  <a class='left carousel-control' href='#gallery' role='button' data-slide='prev'>
      <span class='glyphicon glyphicon-chevron-left' aria-hidden='true'></span>
      <span class='sr-only'>Previous</span>
  </a>
  <a class='right carousel-control' href='#gallery' role='button' data-slide='next'>
      <span class='glyphicon glyphicon-chevron-right' aria-hidden='true'></span>
      <span class='sr-only'>Next</span>
  </a>
</div>"

    #puts gallery_markup
    return gallery_markup
  end

  Liquid::Template.register_tag "gallery", self
end
