#!/usr/bin/ruby -w

def sort_ascending()

	file = open("numbers.txt", "r")
	
	file_data = file.read.split(",\n")
	arr = []
	file_data.each do |val|
		arr << val.to_i
	end
	puts arr.sort
end

if __FILE__ == $PROGRAM_NAME
	sort_ascending()
end