require './utilities'
require './player'
require './game'
include Utilities

display_welcome

hum_player = HumanPlayer.new(get_input("Enter your name: "))
comp_player = CompPlayer.new(get_input("Enter a name for the computer: "))
puts

game = Game.new(comp_player, hum_player)
game.play_game
