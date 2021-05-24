#!/usr/bin/ruby -w

def erehw()

	states = {
		"Oregon" => "OR",
		"Alabama" => "AL",
		"New Jersey" => "NJ",
		"Colorado" => "CO"
		}
	capitals_cities = {
		"OR" => "Salem",
		"AL" => "Montgomery",
		"NJ" => "Trenton",
		"CO" => "Denver"
		}
	if ARGV.length == 1
		check = capitals_cities.key(ARGV[0])
		if check == nil
			puts "Unknown capital city"
		else
			puts states.key(check)
		end
	end
end

erehw()