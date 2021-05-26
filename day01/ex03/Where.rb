#!/usr/bin/ruby -w

def where()

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
		check = states[ARGV[0]]
		if check == nil
			puts "Unknown state"
		else
			puts capitals_cities[check]
		end
	end
end

if __FILE__ == $PROGRAM_NAME
	where()
end