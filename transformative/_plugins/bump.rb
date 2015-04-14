module Jekyll
  module Bump
    def bump(input)
      return input + 1
    end
  end
end

Liquid::Template.register_filter(Jekyll::Bump)