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

  def evaluate_guess(correct_code, guess_code)
    guess_array = guess_code.split("")
    @temp_code_array = correct_code.split("")
    result = []
    result.push(get_black_balls(guess_array))
    result.push(get_white_balls(guess_array))
    result
  end

  private

  def temp_code_array
    @temp_code_array
  end

  def get_black_balls(guess_array)
    result = 0
    guess_array.each_with_index do |char, index|
      if char == temp_code_array[index]
        result += 1
        guess_array[index] = 0
        temp_code_array[index] = -1
      end
    end
    result
  end

  def get_white_balls(guess_array)
    result = 0
    guess_array.each_with_index do |char, index|
      if temp_code_array.include?(char)
        result += 1
        guess_array[index] = 0
        temp_code_array.delete(char)
      end
    end
    result
  end
end
