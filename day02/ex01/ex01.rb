#!/usr/bin/ruby -w

class Html

	attr_reader :file_name
	def initialize(file_name)
		@page_name = file_name
		head()
	end

	def head()

		begin
			raise "#{@page_name + ".html"} already exist!" if File.file?(@page_name + ".html")
		rescue => err
			puts "#{err.class}: #{err}"
			puts "from #{err.backtrace[0]}"
		else
			file = File.new(@page_name + ".html", "w")
			file.puts "<!DOCTYPE html>"
			file.puts "<html>"
			file.puts "<head>"
			file.puts "<title>#{@page_name}</title>"
			file.puts "</head>"
			file.puts "<body>"
			file.close
		end
	end

	def dump(string)

		file = open(@page_name + ".html", "a+")
		line = file.read.split("\n")
		is_body = 0
		is_body_end = 0
		line.each do |x|
			tmp = x.strip
			if tmp == "<body>"
				is_body = 1
			end
			if tmp == "</body>"
				is_body_end = 1
			end
		end
		begin
			raise "Body has already been closed in #{@page_name + ".html"}" if is_body_end == 1
			raise "There is no body tag in #{@page_name + ".html"}" if is_body == 0
		rescue => err
			puts "#{err.class}: #{err}"
			puts "from #{err.backtrace[0]}"
		else
			file.puts "  <p>#{string}</p>"
		end
		file.close
	end

	def finish()

		file = open(@page_name + ".html", "a+")
		line = file.read.split("\n")
		is_end = 0
		line.each do |x|
			tmp = x.strip
			if tmp == "</body>"
				is_end = 1
			end
		end
		begin
			raise "#{@page_name + ".html"} has already been closed" if is_end == 1
		rescue => err
			puts "#{err.class}: #{err}"
			puts "from #{err.backtrace[0]}"
		else
			file.puts "</body>"
		end
		file.close
	end
end

if $0 == __FILE__
	a = Html.new("test")
	10.times{|x| a.dump("titi_number#{x}")}
	a.finish
end