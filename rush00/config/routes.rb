Rails.application.routes.draw do

  #get "up" => "hello#up"
  #get "down" => "hello#down"
  #get "left" => "hello#left"
  #get "right" => "hello#right"
  #get "title" => "hello#title"
  #get "select" => "hello#select"
  #get "start" => "hello#start"
  #get "a" => "hello#a"
  #get "b" => "hello#b"
  #get "power" => "hello#power"

  get "screentitleright" => "hello#screentitle_right"
  get "screentitleleft" => "hello#screentitle_left"
  get "screentitleup" => "hello#screentitle_up"
  get "screentitledown" => "hello#screentitle_down"
  get "screentitlestart" => "hello#screentitle_start"
  get "screentitleselect" => "hello#screentitle_select"
  get "screentitlea" => "hello#screentitle_a"
  get "screentitleb" => "hello#screentitle_b"
  get "screentitlepower" => "hello#screentitle_power"


  get "worldmapright" => "hello#worldmap_right"
  get "worldmapleft" => "hello#worldmap_left"
  get "worldmapup" => "hello#worldmap_up"
  get "worldmapdown" => "hello#worldmap_down"
  get "worldmapstart" => "hello#worldmap_start"
  get "worldmapselect" => "hello#worldmap_select"
  get "worldmapa" => "hello#worldmap_a"
  get "worldmapb" => "hello#worldmap_b"
  get "worldmappower" => "hello#worldmap_power"

  get "battleright" => "hello#battle_right"
  get "battleleft" => "hello#battle_left"
  get "battleup" => "hello#battle_up"
  get "battledown" => "hello#battle_down"
  get "battlestart" => "hello#battle_start"
  get "battleselect" => "hello#battle_select"
  get "battlea" => "hello#battle_a"
  get "battleb" => "hello#battle_b"
  get "battlepower" => "hello#battle_power"


  get "moviedexright" => "hello#moviedex_right"
  get "moviedexleft" => "hello#moviedex_left"
  get "moviedexup" => "hello#moviedex_up"
  get "moviedexdown" => "hello#moviedex_down"
  get "moviedexstart" => "hello#moviedex_start"
  get "moviedexselect" => "hello#moviedex_select"
  get "moviedexa" => "hello#moviedex_a"
  get "moviedexb" => "hello#moviedex_b"
  get "moviedexpower" => "hello#worldmap_power"

  get "saveslotright" => "hello#saveslot_right"
  get "saveslotleft" => "hello#saveslot_left"
  get "saveslotup" => "hello#saveslot_up"
  get "saveslotdown" => "hello#saveslot_down"
  get "saveslotstart" => "hello#saveslot_start"
  get "saveslotselect" => "hello#saveslot_select"
  get "saveslota" => "hello#save"
  get "saveslotb" => "hello#load"
  get "saveslotpower" => "hello#saveslot_power"



  root "hello#screentitle"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
