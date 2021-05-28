#!/usr/bin/ruby -w

def whereto()

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
	
	if ARGV.length != 1
		return
	end
	arr = ARGV[0].split(",")
	arr.each do |arg|
		if arg == ""
			exit
		end
	end
	arr = arr.map do |val|
		val.split.each{|i| i.capitalize!}.join(' ')
	end
	arr.each do |val| 
		if states.key(capitals_cities.key(val)) != nil
			puts "#{val} is the capital of #{states.key(capitals_cities.key(val))} (akr: #{capitals_cities.key(val)})"
		elsif capitals_cities[states[val]] != nil
			puts "#{capitals_cities[states[val]]} is the capital of #{val} (akr: #{states[val]})"
		elsif val == ""
		else
			puts "#{val} is neither a capital city nor a state"
		end
	end
end

if __FILE__ == $PROGRAM_NAME
	whereto()
end