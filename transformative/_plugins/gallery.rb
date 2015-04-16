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
    # source = ", <cite>#{@x["source"]}</cite>"                if @x["source"]
    # date   = " <span class=\"date\">(#{@x["date"]})</span>"  if @x["date"]
    # "#{super}".each_line {|line| puts line}


    gallery_markup ="" +
"<div id='gallery' class='carousel slide' data-ride='carousel'>
  <!-- Indicators -->
  <ol class='carousel-indicators'>
      <li data-target='#gallery' data-slide-to='0' class='active'></li>
      <li data-target='#gallery' data-slide-to='1'></li>
      <li data-target='#gallery' data-slide-to='2'></li>
  </ol>
  <!-- Wrapper for slides -->"
    flag = true
    "#{super}".each_line {|full_size_image, index|
      unless full_size_image == "\n"
        if flag
          flag = false
        gallery_markup << "" +
  "<div class='carousel-inner' role='listbox'>
    <div class='item active'>
        <img src='http://lorempixel.com/output/cats-q-c-640-480-8.jpg' alt='...'>
        <div class='carousel-caption'>
            cat "+full_size_image+"
        </div>
    </div>
  </div>"
        else
          gallery_markup << "" +
  "<div class='carousel-inner' role='listbox'>
    <div class='item'>
        <img src='http://lorempixel.com/output/cats-q-c-640-480-8.jpg' alt='...'>
        <div class='carousel-caption'>
            cat "+full_size_image+"
        </div>
    </div>
  </div>"
        end
      end
    }

    gallery_markup << "" +
"<!-- Controls -->
  <a class='left carousel-control' href='#gallery' role='button' data-slide='prev'>
      <span class='glyphicon glyphicon-chevron-left' aria-hidden='true'></span>
      <span class='sr-only'>Previous</span>
  </a>
  <a class='right carousel-control' href='#gallery' role='button' data-slide='next'>
      <span class='glyphicon glyphicon-chevron-right' aria-hidden='true'></span>
      <span class='sr-only'>Next</span>
  </a>
</div>"
    puts gallery_markup
    return gallery_markup
  end

  Liquid::Template.register_tag "gallery", self
end
