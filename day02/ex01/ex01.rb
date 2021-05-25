#!/usr/bin/ruby -w

class Html

	attr_reader :file_name
	def initialize(file_name)
		@page_name = file_name
		
		if File.file?(@page_name + ".html")
			raise "#{@page_name + ".html"} already exist!"
		else
		file = File.new(@page_name + ".html", "w")
		file.close
		head()
		end
	end

	def head()
		file = open(@page_name + ".html", "w")
		file.puts "<!DOCTYPE html>"
		file.puts "<html>"
		file.puts "<head>"
		file.puts "<title>#{@page_name}</title>"
		file.puts "</head>"
		file.puts "<body>"
		file.close
	end

	def dump(string)
		file = open(@page_name + ".html", "a")
		file.puts "  <p>#{string}</p>"
		file.close
	end

	def finish()
		file = open(@page_name + ".html", "a")
		file.puts "</body>"
		file.puts "</html>"
		file.close
		return 7
	end
end