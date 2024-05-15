include Utilities

class Player
  COLOR_HASH = {
    "0": "R",
    "1": "O",
    "2": "Y",
    "3": "G",
    "4": "B",
    "5": "I",
  }

  attr_reader :name, :num_wins, :code, :guess

  def initialize(name)
    @name = name
    @num_wins = 0
  end

  def increase_wins
    @num_wins += 1
  end
end
