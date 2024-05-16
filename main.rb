require './utilities'
require './player'
require './computer'
require './user'
require './game'
include Utilities

display_welcome
user = User.new(get_input("Enter your name: "))
comp = Computer.new("Computer")

game = Game.new(comp, user)
game.play_game
