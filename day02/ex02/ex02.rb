#!/usr/bin/ruby -w

class Html

	attr_reader :file_name
	def initialize(file_name)
		@page_name = file_name
		head()
	end

	def head()

		begin
			if File.file?(@page_name + ".html")
				raise Dup_file.new(@page_name)
			end
		rescue => err
			err.show_state()
			@page_name = err.correct()
			err.explain()
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
		line_end_body_num = 0
		line.each_with_index do |x, i|
			tmp = x.strip
			if tmp == "<body>"
				is_body = 1
			end
			if tmp == "</body>"
				is_body_end = 1
				line_end_body_num = i + 1
			end
		end
		begin
			raise "There is no body tag in #{@page_name + ".html"}" if is_body == 0
		rescue => err
			puts "#{err.class}: #{err}"
			puts "from #{err.backtrace[0]}"
		end
		begin
			if is_body_end == 1
				raise Body_closed.new(@page_name, string)
			end
		rescue => err
			file.close
			err.show_state()
			err.correct()
			err.explain(line_end_body_num)
		else
			file.puts "  <p>#{string}</p>"
			file.close
		end
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
			file.puts "</body>"
		rescue => err
			puts "#{err.class}: #{err}"
			puts "from #{err.backtrace[0]}"
		end
		file.close
	end
end

class Dup_file < StandardError

	attr :page_name
	def initialize(page_name)
		@page_name = page_name
	end
	def show_state()
		if File.file?(@page_name + ".html")
			html_file = @page_name + ".html"
			dir = File.dirname(html_file)
			puts "A file named #{html_file} was already there: #{dir}/#{html_file}"
		end
	end

	def correct()
		@page_name = @page_name + ".new"
		if File.file?(@page_name + ".html")
			correct()
			return @page_name
		end
		file = File.new(@page_name + ".html", "w")
		file.puts "<!DOCTYPE html>"
		file.puts "<html>"
		file.puts "<head>"
		file.puts "<title>#{@page_name}</title>"
		file.puts "</head>"
		file.puts "<body>"
		file.close
		return @page_name
	end

	def explain()
		html_file = @page_name + ".html"
		dir = File.dirname(html_file)
		puts "Appended .new in order to create requested file: #{dir}/#{html_file}"
	end
end

class Body_closed < StandardError

	attr :page_name
	def initialize(page_name, string)
		@page_name = page_name
		@string = string
	end

	def show_state()
		html_file = @page_name + ".html"
		puts "In #{html_file} body was closed :"
	end

	def correct()
		file = open(@page_name + ".html", "r")
		line = file.read.split("\n")
		file.close
		new_file = File.new(@page_name + ".html", "w")
		line.each do |x|
			if x.include?("</body>")
				new_file.puts "  <p>#{@string}</p>"
			end
			new_file.puts x
		end
		new_file.close
	end

	def explain(line_end_body_num)
		puts " ln :#{line_end_body_num} </body> : text has been inserted and tag moved at the end of it."
	end
end

if $0 == __FILE__
	a = Html.new("test")
	a.dump("Lorem_ipsum")
	a.finish
end
