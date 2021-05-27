#!/usr/bin/ruby -w

class Elem

  attr_reader :tag, :content, :tag_type, :opt
  def initialize(tag, content = [], tag_type = 'double', opt = {})
    @tag = tag
    @content = content
    @tag_type = tag_type
    @opt = opt
  end

  def add_content(*object)
    object.each do |obj|
      if obj.is_a?(Array)
        obj.each do |obj_element|
          @content << obj_element
        end
      else
        @content << obj
      end
    end
  end

  def to_s
    ret = ""
    ret += "<#{@tag}"
    if @opt != ''
      @opt.each do |key, value|
        ret += " #{key}=\'#{value}\'"
      end
    end
    if @tag_type == "simple"
      ret += " />"
      return ret
    end
    ret += ">"
    if @content.is_a?(Text)
      ret += @content.to_s
    elsif @content.is_a?(String)
      ret += @content.to_s
    else
      ret += "\n"
      @content.each do |obj|
        ret += obj.to_s
        ret += "\n"
      end
    end
    ret += "</#{tag}>"
    return ret
  end
end

class Text
  def initialize(input)
    @input = input
  end

  def to_s
    return @input
  end
end

class Tagger < Elem
  def initialize(elem, opt = {})
    tag = self.class.to_s
    simple_type = ["Meta", "Img", "Hr", "Br"]
    if simple_type.include?(tag)
      tag_type = "simple"
    else
      tag_type = "double"
    end
    super(tag, elem, tag_type, opt)
  end
end

class Html < Tagger
end
class Head < Tagger
end
class Body < Tagger
end
class Title < Tagger
end
class Meta < Tagger
end
class Img < Tagger
end
class Th < Tagger
end
class Tr < Tagger
end
class Td < Tagger
end
class Ul < Tagger
end
class Ol < Tagger
end
class Li < Tagger
end
class H1 < Tagger
end
class H2 < Tagger
end
class P < Tagger
end
class Div < Tagger
end
class Span < Tagger
end
class Hr < Tagger
end
class Br < Tagger
end

if $0 == __FILE__
  puts Html.new([Head.new([Title.new("Hello ground!")]), Body.new([H1.new("Oh no, not again!"), Img.new([], {'src':'http://i.imgur.com/pfp3T.jpg'}) ]) ])
end