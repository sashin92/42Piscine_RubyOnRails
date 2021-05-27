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



if $0 == __FILE__
  html = Elem.new(Text.new("html"))
  head = Elem.new("head")
  body = Elem.new("body")
  img = Elem.new('img', '', 'simple',{'src':'http://i.imgur.com/pfp3T.jpg'})
  title = Elem.new("title")
  head.add_content(title)
  body.add_content(img)
  html.add_content([head, body])
  puts html
end