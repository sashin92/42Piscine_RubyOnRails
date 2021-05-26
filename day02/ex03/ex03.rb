#!/usr/bin/ruby -w

class Elem

  attr_reader :tag, :contents, :tag_type, :opt
  def initialize(tag, contents = '', tag_type = '', opt = '')
    @tag = tag
    @contents = contents
    @tag_type = tag_type
	  @opt = opt
    if @contents == ''
      @contents = []
    end
  end

  def add_content(object)
    object.each do |x|
     @contents << object
    end
  end

  def to_s
    ret = ""
    ret += "<#{@tag}"
    if @opt != ''
      @opt.each do |key, value|
        ret += " #{key}=#{value}"
      end
    end
    if @tag_type == "simple"
      ret += " />"
      return ret
    end
    ret += ">"
    if @contents.is_a?(Text)
      ret += @content.to_s
    else
      ret += "\n"
      @contents.each do |obj|
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



if $0 == __FILE__
  a = Elem.new("ha")
  b = Elem.new("hi")
  # a.add_content(b)
  puts a
  # html = Elen.new('head') # <head></head>
end