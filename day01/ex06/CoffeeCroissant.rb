#!/usr/bin/ruby -w

def coffee()

	data = [
		['Frank', 33],
		['Stacy', 15],
		['Juan' , 24],
		['Dom' , 32],
		['Steve', 24],
		['Jill' , 24]
		]

		data = data.sort_by {|key, value| key}
		data = data.sort_by {|key, value| value}
		data.each do |key, value|
			puts "#{key}"
		end
end

if __FILE__ == $PROGRAM_NAME
	coffee()
end