class HelloController < ApplicationController
	def initialize
		if !$player
			$player = {}
			$player["name"] = "unknown player"
			$player["hp"] = 100
			$player["position"] = 0
			$player["prev_position"] = 0
			$player["opponent"] = 0
			$player["hit_count"] = 1
			$player["damage"] = 30
			$player["my_moviemon"] = []
			$player["movieball"] = 0
			$view = {}

			$selected = 0

			$game = {}
			$game["prev_page"] = ""
			$game["pages"] = "screentitle"
			$player["my_moviemon"] << self.search("fifty-shades-of-grey")
			$game["monsters"] = []
			$game["encounter"] = 0

			["marvel", "iron_man", "spider_man", "deadpool", "thor", "black_panther", "hulk", "joker", "aquaman", "superman"].each_with_index do |var, index|
				$game["monsters"] << self.search(var)
				$game["monsters"][index]["position"] = rand(99) + 1
				$game["monsters"][index]["hp"] = $game["monsters"][index]["imdbRating"].to_i * 8
				$game["monsters"][index]["full_hp"] = $game["monsters"][index]["hp"]
			end
		end
		super
	end
	def save
		fp = File.open("save.json", "r")
		data = fp.read
		if data == ""
			hash = {}
		else
			hash = JSON.parse(data)
		end
		hash["#{$selected}"] = $player
		fp.close
		fp = File.open("save.json", "w")
		fp.puts hash.to_json
		fp.close
		$view = hash
		@msg = "Save Succeed!!"
		render "saveslot"
	end
	def load
		fp = File.open("save.json", "r")
		data = fp.read
		if data == ""
			hash = {}
		else
			hash = JSON.parse(data)
		end
		fp.close
		$player = hash["#{$selected}"]
		@msg = "Load Succeed!!"
		render "saveslot"
	end
	def search(keyword)
		parse = ""
		URI.open("http://www.omdbapi.com/?t=#{keyword}&apikey=dfd3c6c6") {|f|
			f.each_line {|x| parse = x}
		}
		return JSON.parse(parse)
	end

	def get_movie
		return $player["my_moviemon"]
	end

	def screentitle_right
		render "screentitle"
	end
	def screentitle_left
		render "screentitle"
	end
	def screentitle_up
		render "screentitle"
	end
	def screentitle_down
		render "screentitle"
	end
	def screentitle_select

		if !File.file?("save.json")
			fp = File.open("save.json", "w")
			fp.close
		end
		fp = File.open("save.json", "r")
		data = fp.read
		if data == ""
			hash = {}
		else
			hash = JSON.parse(data)
		end
		fp.close
		$view = hash

		$selected = 0
		$game["prev_page"] = "screentitle"
		$game["pages"] = "saveslot"
		render "saveslot"
	end
	def screentitle_start
		$game["pages"] = "worldmap"
		render "worldmap"
	end
	def screentitle_a
		render "screentitle"
	end
	def screentitle_b
		render "screentitle"
	end
	def screentitle_power
		$player = nil
		render "screentitle"
	end


	def worldmap_right
		$player["prev_position"] = $player["position"]
		if $player["position"] % 10 != 9
			if rand(6) % 6  == 0
				$player["movieball"] = $player["movieball"] + 1
				@msg = "YOU GET A MOVIEBALL!!!!!"
			end
			$player["position"] = $player["position"] + 1
		end
		$game["monsters"].each_with_index do |var,index|
			if var["position"] == $player["position"] && var["hp"] > 0 && $player["hp"] > 0
				@hash = $game["monsters"][$player["opponent"]]
				$player[:prev_hp] = $player["hp"]
				$game["monsters"][index][:prev_hp] = var["hp"]
				$game["pages"] = "battle"
				$player["opponent"] = index
				$game["encounter"] = 1
				render "battle"
				return
			end
		end
		render "worldmap"
	end
	def worldmap_left
		$player["prev_position"] = $player["position"]
		if $player["position"] % 10 != 0
			if rand(6) % 6  == 0
				$player["movieball"] = $player["movieball"] + 1
				@msg = "YOU GET A MOVIEBALL!!!!!"
			end
			$player["position"] = $player["position"] - 1
		end
		$game["monsters"].each_with_index do |var,index|
			if var["position"] == $player["position"] && var["hp"] > 0 && $player["hp"] > 0
				@hash = $game["monsters"][$player["opponent"]]
				$player[:prev_hp] = $player["hp"]
				$game["monsters"][index][:prev_hp] = var["hp"]
				$game["pages"] = "battle"
				$player["opponent"] = index
				$game["encounter"] = 1
				render "battle"
				return
			end
		end
		render "worldmap"
	end
	def worldmap_up
		$player["prev_position"] = $player["position"]
		if $player["position"] / 10 != 0
			if rand(6) % 6  == 0
				$player["movieball"] = $player["movieball"] + 1
				@msg = "YOU GET A MOVIEBALL!!!!!"
			end
			$player["position"] = $player["position"] - 10
		end
		$game["monsters"].each_with_index do |var,index|
			if var["position"] == $player["position"] && var["hp"] > 0 && $player["hp"] > 0
				@hash = $game["monsters"][$player["opponent"]]
				$player[:prev_hp] = $player["hp"]
				$game["monsters"][index][:prev_hp] = var["hp"]
				$game["pages"] = "battle"
				$player["opponent"] = index
				$game["encounter"] = 1
				render "battle"
				return
			end
		end
		render "worldmap"
	end
	def worldmap_down
		$player["prev_position"] = $player["position"]
		if $player["position"] / 10 < 9
			if rand(6) % 6  == 0
				$player["movieball"] = $player["movieball"] + 1
				@msg = "YOU GET A MOVIEBALL!!!!!"
			end
			$player["position"] = $player["position"] + 10
		end
		$game["monsters"].each_with_index do |var,index|
			if var["position"] == $player["position"] && var["hp"] > 0 && $player["hp"] > 0
				@hash = $game["monsters"][$player["opponent"]]
				$player[:prev_hp] = $player["hp"]
				$game["monsters"][index][:prev_hp] = var["hp"]
				$game["pages"] = "battle"
				$player["opponent"] = index
				$game["encounter"] = 1
				render "battle"
				return
			end
		end
		render "worldmap"
	end
	def worldmap_start
		$game["pages"] = "moviedex"
		render "moviedex"
	end
	def worldmap_select

		if !File.file?("save.json")
			fp = File.open("save.json", "w")
			fp.close
		end
		fp = File.open("save.json", "r")
		data = fp.read
		if data == ""
			hash = {}
		else
			hash = JSON.parse(data)
		end
		fp.close
		$view = hash
		$selected = 0
		$game["prev_page"] = "worldmap"
		$game["pages"] = "saveslot"
		render "saveslot"
	end
	def worldmap_a
		render "worldmap"
	end
	def worldmap_b
		render "worldmap"
	end
	def worldmap_power
		$player = nil
		$game["pages"] = "screentitle"
		render "screentitle"
	end


	def saveslot_right
		render "saveslot"
	end
	def saveslot_left
		render "saveslot"
	end
	def saveslot_down
		if $selected < 2
		$selected += 1
		end
		render "saveslot"
	end
	def saveslot_up
		if $selected > 0
			$selected -= 1
		end
		render "saveslot"
	end
	def saveslot_start
		render "saveslot"
	end
	def saveslot_select
		if $game["prev_page"] == "worldmap"
			$game["pages"] = "worldmap"
			$selected = 0
			render "worldmap"
			return
		else
			$game["pages"] = "screentitle"
			$selected = 0
			render "screentitle"
		end
	end
	def saveslot_power
		$player = nil
		$game["pages"] = "screentitle"
		render "screentitle"
	end


	def battle_right
		render "battle"
	end
	def battle_left
		render "battle"
	end
	def battle_down
		render "battle"
	end
	def battle_up
		render "battle"
	end
	def battle_start
		render "battle"
	end
	def battle_select
		render "battle"
	end
	def battle_a
		if $player["movieball"] == 0
			@msg = "YOU HAVE NO MOVIEBALL!!!!!!"
			$game["pages"] = "worldmap"
			render "worldmap"
			return
		end
		if $player == nil
			$game["pages"] = "screentitle"
			render "screentitle"
			return
		end
		$game["encounter"] = 0
		index = $player["opponent"]
		hash = $game["monsters"][$player["opponent"]]
		if hash["hp"] == 0
			hash["hp"] = $game["monsters"][$player["opponent"]]["imdbRating"].to_i * 8
			$player["my_moviemon"] << hash
			$player["position"] = $player["prev_position"]
			$player["hit_count"] += 1
			$player["damage"] += 4
			hash["position"] = rand(100)
			hash["position"] == $player["prev_position"] + 1 if  hash["position"] == $player["prev_position"]
			hash["position"] = hash["position"] % 100
			$game["pages"] = "worldmap"
			render "worldmap"
			return
		elsif $player["hp"] == 0
			$player["hp"] = 100
			$player["position"] = $player["prev_position"]
			$game["pages"] = "worldmap"
			$player["hit_count"] -= 1
			$player["damage"] -= 4
			$game["pages"] = "worldmap"
			render "worldmap"
			return
		end

		$player["hitting"] = $player["damage"] + rand(3) - rand(8)
		hash["hp"] = hash["hp"] - $player["hitting"]

		if hash["hp"] <=0
			$player["movieball"] -= 1
			hash["hp"] = 0
			render "battle"
			return
		end

		hash["hitting"] = (hash["imdbRating"].to_i * 3) + rand(5) - rand(5)
		$player["hp"] = $player["hp"] - hash["hitting"]
		if $player["hp"] <=0
			$player["hp"] = 0
			deleted_monster = $player["my_moviemon"].pop
			if deleted_monster == nil
				$player = nil
				$game["prev_page"] = "battle"
				$game["pages"] = "screentitle"
				render "screentitle"
				return
			end
		end
		render "battle"
	end
	def battle_b
		if $player["hp"] == 0 || $game["monsters"][$player["opponent"]]["hp"] == 0
			render "battle"
			return
		end
		@msg =  "You cowrd!!!"
		$game["encounter"] = 0
		$player["hp"] = $player[:prev_hp]
		$game["monsters"][$player["opponent"]]["hp"] = $game["monsters"][$player["opponent"]][:prev_hp]
		$player["position"] = $player["prev_position"]
		$game["pages"] = "worldmap"
		render "worldmap"
	end
	def battle_power
		$player = nil
		$game["pages"] = "screentitle"
		render "screentitle"
	end


	def moviedex_right
		$selected = 0 if !$selected
		$selected = $selected + 1
		if ($selected > self.get_movie.size - 1)
			$selected = 0
		end
		render "moviedex"
	end
	def moviedex_left
		$selected = 0 if !$selected
			$selected = $selected - 1
			if ($selected < 0)
				$selected = self.get_movie.size - 1
			end
			if ($selected < 0)
				$selected = 0
			end
			render "moviedex"
		end
		def moviedex_down
			render "moviedex"
		end
		def moviedex_up
			render "moviedex"
		end
		def moviedex_start
			$game["pages"] = "worldmap"
			render "worldmap"
		end
		def moviedex_select
			render "moviedex"
		end
		def moviedex_a
			render "moviedex"
		end
		def moviedex_b
			render "moviedex"
		end
	def moviedex_power
			$player = nil
			$game["pages"] = "screentitle"
			render "screentitle"
	end
end
