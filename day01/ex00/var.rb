#!/usr/bin/ruby -w

def my_var()

	a = 10
	b = "10"
	c = nil
	d = 10.0
	puts "my variables :"
	puts "       a contains: #{if a == nil then "nil" else a end} and is a type: #{a.class}"
	puts "       b contains: #{if b == nil then "nil" else b end} and is a type: #{b.class}"
	puts "       c contains: #{if c == nil then "nil" else c end} and is a type: #{c.class}"
	puts "       d contains: #{if d == nil then "nil" else d end} and is a type: #{d.class}"
end

my_var()
