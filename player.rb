class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class CompPlayer < Player
  COLOR_MAP = {
    "0": "R",
    "1": "O",
    "2": "Y",
    "3": "G",
    "4": "B",
    "5": "I",
    "6": "V",
    "7": "P"
  }

  def make_code
    result = get_random_color
    until result.length == 4
      color = get_random_color
      next if result.include?(color)

      result += color
    end
    @code = result
  end

  def evaluate_guess(player)
    guess_array = player.guess.split("")
    result = []
    @temp_code_array = code.split("")
    result.push(get_black_balls(guess_array))
    return "#{player.name} guessed right!!!" if result[0] == 4

    result.push(get_white_balls(guess_array))
    result
  end

  private

  def code
    @code
  end

  def temp_code_array
    @temp_code_array
  end

  def get_random_color
    COLOR_MAP[rand(8).to_s.to_sym]
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
    puts "White balls"
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

class HumanPlayer < Player
  attr_reader :guess

  def make_guess
    puts "#{name} enter your guess as a four letter string"
    result = gets.chomp.upcase
    result = guess unless result.length == 4

    @guess = result
  end
end
