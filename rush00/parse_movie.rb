require 'open-uri'

class Omdb # Title, Year, Director, Poster, imdbRating 정도만 파싱함녀 될 듯
	def search(keyword)
		parse = ""
		URI.open("http://www.omdbapi.com/?t=#{keyword}&apikey=dfd3c6c6") {|f|
			f.each_line {|x| parse = x}
		}
		arr = parse.split(",")
		return arr
	end
end