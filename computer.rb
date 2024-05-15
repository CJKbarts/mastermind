class Computer < Player
  def make_code
    @code = make_random_sequence
    puts "Computer has created its code. Start guessing"
  end

  def make_guess(evaluation = nil)
    get_input("Press enter to continue")
    @guess = make_random_sequence if evaluation == nil

    # to be completed

    puts "Computer guessed #{@guess}"
  end

  private

  def get_random_color
    COLOR_HASH[rand(6).to_s.to_sym]
  end

  def make_random_sequence
    result = ''
    until result.length == 4
      color = get_random_color
      next if result.include?(color)

      result += color
    end

    result
  end
end
