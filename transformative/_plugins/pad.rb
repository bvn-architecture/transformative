module Jekyll
  module Pad
    def pad(input)
        if input < 10
            input = "0" + input.to_s
        end
      return input
    end
  end
end

Liquid::Template.register_filter(Jekyll::Pad)