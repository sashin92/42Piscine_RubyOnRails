#!/usr/bin/ruby -w

class Elem

  attr_reader :tag, :content, :tag_type, :opt
  def initialize(tag, content = '', tag_type = 'double', opt = '')
    @tag = tag
    @content = content
    @tag_type = tag_type
    @opt = opt
    if @content == ''
      @content = []
    end
    if @opt == ''
      @opt = {}
    end
    if @content.is_a?(String)
      @content = [@content]
    end
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
    else
      if !["title", "li", "h1", "h2", "p"].include?(@tag)
        ret += "\n"
      end
      @content.each do |obj|
        ret += obj.to_s
        if !["title", "li", "h1", "h2", "p"].include?(@tag)
          ret += "\n"
        end
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

class Html < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("html", elem, "double", '')
    else 
      super("html", elem, "double", opt[0])
    end
  end
end

class Head < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("head", elem, "double", '')
    else 
      super("head", elem, "double", opt[0])
    end
  end
end

class Body < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("body", elem, "double", '')
    else 
      super("body", elem, "double", opt[0])
    end
  end
end

class Title < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("title", elem, "double", '')
    else 
      super("title", elem, "double", opt[0])
    end
  end
end

class Meta < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("meta", elem, "simple", '')
    else 
      super("meta", elem, "simple", opt[0])
    end
  end
end

class Img < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("img", elem, "simple", '')
    else 
      super("img", elem, "simple", opt[0])
    end
  end
end

class Th < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("th", elem, "double", '')
    else 
      super("th", elem, "double", opt[0])
    end
  end
end

class Tr < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("tr", elem, "double", '')
    else 
      super("tr", elem, "double", opt[0])
    end
  end
end

class Td < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("th", elem, "double", '')
    else 
      super("th", elem, "double", opt[0])
    end
  end
end

class Ul < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("ul", elem, "double", '')
    else 
      super("ul", elem, "double", opt[0])
    end
  end
end


class Ol < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("ol", elem, "double", '')
    else 
      super("ol", elem, "double", opt[0])
    end
  end
end

class Li < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("li", elem, "double", '')
    else 
      super("li", elem, "double", opt[0])
    end
  end
end

class H1 < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("h1", elem, "double", '')
    else 
      super("h1", elem, "double", opt[0])
    end
  end
end

class H2 < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("h2", elem, "double", '')
    else 
      super("h2", elem, "double", opt[0])
    end
  end
end

class P < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("p", elem, "double", '')
    else 
      super("p", elem, "double", opt[0])
    end
  end
end

class Div < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("div", elem, "double", '')
    else 
      super("div", elem, "double", opt[0])
    end
  end
end

class Span < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("span", elem, "double", '')
    else 
      super("span", elem, "double", opt[0])
    end
  end
end

class Hr < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("hr", elem, "simple", '')
    else 
      super("hr", elem, "simple", opt[0])
    end
  end
end

class Br < Elem
  def initialize(elem, *opt)
    if opt.size == 0
      super("br", elem, "simple", '')
    else 
      super("br", elem, "simple", opt[0])
    end
  end
end


if $0 == __FILE__

  puts Html.new([Head.new([Title.new("Hello ground!")]), Body.new([H1.new("Oh no, not again!"), Img.new([], {'src':'http://i.imgur.com/pfp3T.jpg'}) ]) ])
end