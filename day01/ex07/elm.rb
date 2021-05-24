#!/usr/bin/ruby -w

def elm()
	file = open("periodic_table.txt", "r")
	arr = file.read.split("\n")
	# html_file = File.new("periodic_table.html", "w")

	line = arr[0].split(" = ")

	puts line[1]
	
	a = line[1].to_h

	# puts hash

	# arr.each do |line|

	# end


	



	#  html_file.puts "<!DOCTYPE html>"
	#  html_file.puts "<html>"

	#  html_file.puts "</html>"
end

elm()