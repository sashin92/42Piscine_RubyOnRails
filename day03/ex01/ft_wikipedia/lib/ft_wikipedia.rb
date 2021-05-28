#! /usr/bin/env ruby -w

require 'nokogiri'
require 'open-uri'

class Ft_wikipedia

  def initialize
    @count = 0
    @first = ""
    @arr = []
  end

  def search(keyword)

    link = "https://en.wikipedia.org/wiki/#{keyword}"
    if @count == 0
      puts "First search @ :#{link}"
    else
      puts link
    end

    @arr.each do |x|
      begin
        if x == keyword
          raise StandardError, "Loop detected there is no way to philosophy here"
        end
      rescue => err
        puts err
        return
      end
    end
    @arr << keyword
    
    @count += 1
    if keyword == "Philosophy"
      puts @count
      return @count
    end
    begin
      doc = Nokogiri::HTML(URI.open(link))
    rescue
      puts "There are no page :#{link}"
      return
    end
    doc.search('div.mw-parser-output p a', 'div.mw-parser-output ul a').each do |x|
      if x.to_s.include?("/wiki/")
        @first = x.to_s
        break
      end
    end
    begin
      if @first == ""
        raise StandardError, "Dead end page reached"
      end
    rescue => err
      puts err
      return
    end
    @first.to_s.split("\"").each do |x|
      if x.include?("/wiki/") 
        parse = x
        after = parse.to_s.split("/")[2]
        search(after)
        return
      end
    end
  end
end

a = Ft_wikipedia.new

a.search("kiss")