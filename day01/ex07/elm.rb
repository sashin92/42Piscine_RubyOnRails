#!/usr/bin/ruby -w

def make_hash(data)

	hash = Hash.new
	arr_data = data.split(",").map {|str| str.strip}
	arr_data.each do |x|
		tmp = x.split(":").map {|str| str.strip}
		hash[tmp[0]] = tmp[1]
		hash["position"] = hash["position"].to_i
	end
	return hash
end

def make_html(all)

	html_file = File.new("periodic_table.html", "w")
	html_file.puts "<!DOCTYPE html>"
	html_file.puts "<html lang='en'>"
	html_file.puts "<head>"
	html_file.puts "  <meta charset=\"utf-8\">"
	html_file.puts "  <title>ex07</title>"
	html_file.puts "</head>"
	html_file.puts "<body>"
	html_file.puts "  <table>"
	j = 0
	all.each_with_index do |value, i|
		if i % 2 == 0
			name = all[i]
			hash = all[i + 1]
			j = j % 18
			if hash["position"] == 0
				html_file.puts "    <tr>"
			end
			if hash["position"] != j
				j.upto(hash["position"] - 1) do
					html_file.puts "      <td></td>"
				end
				j = hash["position"]
			end
			html_file.puts "      <td style=\"border: 1px solid black; padding:10px\">"
			html_file.puts "        <h4>#{name}</h4>"
			html_file.puts "          <ul>"
			html_file.puts "            <li>No #{hash["number"]}</li>"
			html_file.puts "            <li>#{hash["small"]}</li>"
			html_file.puts "            <li>#{hash["molar"]}</li>"
			html_file.puts "            <li>#{hash["electron"]} electron</li>"
			html_file.puts "          </ul>"
			html_file.puts "      </td>"
			if hash["position"] == 17
				html_file.puts "    </tr>"
			end
			j = j + 1
		end
	end
	 html_file.puts "  </table>"
	 html_file.puts "</body>"
	 html_file.puts "</html>"
end

def elm()
	
	file = open("periodic_table.txt", "r")
	line = file.read.split("\n")
	all = Array.new
	line.each do |x|
		name_data = x.split("=").map {|str| str.strip}
		all.push name_data[0]
		all.push make_hash(name_data[1])
	end
	make_html(all)
end

if __FILE__ == $PROGRAM_NAME
	elm()
end