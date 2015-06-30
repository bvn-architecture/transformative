require "json"
class HashedImageName < Liquid::Block

  def initialize(tagName, markup, tokens)
    super
  end

  def render(context)
    begin
      input = super.strip
    
      newName  = input.split(".")  
      target   = "_site/generated/"+newName[0]+"*"+newName[1]
      thisHash = Dir.glob(target)[0].split(".")[0].split(//).last(6).join
      newName  = "generated/"+newName[0]+"-525by300-"+thisHash+"."+newName[1]
      # puts newName
    
      return newName
    rescue
      # puts "freaky with |" + super + "|"
      target   = "_site/generated/asb/asb-N66*.jpg"
      thisHash = Dir.glob(target)[0].split(".")[0].split(//).last(6).join
      newName  = "generated/asb-N66-525by300-"+thisHash+".jpg"
      # puts newName
    
      return newName
    end
  end

  Liquid::Template.register_tag "hashedImageName", self
end 
