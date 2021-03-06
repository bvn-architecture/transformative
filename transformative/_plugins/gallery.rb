require "json"
class Gallery < Liquid::Block

  def initialize(tagName, markup, tokens)
    super

    if markup.to_s == ''
      markup = "{'dummy':''}"#I don't like this at all!
    end
    @x = JSON.parse markup
  end

  def render(context)
    newpics = []
    "#{super}".split("<picture>").each {|pic| newpics.push("<picture>"<<pic)}

    gallery_markup ="" +
"<div id='gallery' class='carousel slide' data-ride='carousel'>
<!--indicators were in here-->
  <ol class='carousel-indicators'>
  <li data-target='#carousel-example-generic' data-slide-to='0' class='active'></li>"

for i in 1..newpics.length
   gallery_markup << "<li data-target='#carousel-example-generic' data-slide-to='" + i.to_s + "'></li>"
end

  gallery_markup << "</ol>
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
      <svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 595.3 841.9'><path fill='#B4B4B4' d='M267 508.4l-26-26 61.3-61.5-61.4-61.4 26-26 87.4 87.3'/></svg>
      <span class='sr-only'>Previous</span>
  </a>
  <a class='right carousel-control' href='#gallery' role='button' data-slide='next'>
      <svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 595.3 841.9'><path fill='#B4B4B4' d='M267 508.4l-26-26 61.3-61.5-61.4-61.4 26-26 87.4 87.3'/></svg>
      <span class='sr-only'>Next</span>
  </a>
</div>"

    #puts gallery_markup
    return gallery_markup
  end

  Liquid::Template.register_tag "gallery", self
end
