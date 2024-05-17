class Computer < Player
  def initialize(name)
    super(name)
    @all_codes = get_all_codes
  end

  def make_code
    @possible_codes = all_codes.slice(0, 1296)
    @code = get_random_sequence
    puts "Computer has created its code. Start guessing"
  end

  def make_guess(evaluation)
    get_input("Press enter to continue")
    if evaluation == nil
      @possible_codes = all_codes.slice(0, 1296)
    else
      remove_wrong_codes(evaluation)
    end

    @guess = get_random_sequence
    puts "Computer guessed #{guess}"
  end

  def guess
    convert_to_char_code(@guess)
  end

  def code
    convert_to_char_code(@code)
  end

  private

  def all_codes
    @all_codes
  end

  def get_all_codes
    permutations = [1, 2, 3, 4, 5, 6].repeated_permutation(4).to_a
    result = permutations.map { |permutation| permutation.join }
    result
  end

  def possible_codes
    @possible_codes
  end

  def get_random_color
    COLOR_HASH[rand(6).to_s.to_sym]
  end

  def get_random_sequence
    possible_codes[rand(possible_codes.length)]
  end

  def remove_wrong_codes(evaluation)
    @possible_codes = possible_codes.filter { |possible_code| evaluate_guess(@guess, possible_code) == evaluation }
  end

  def convert_to_char_code(num_code)
    result = ""
    num_code.to_s.each_char { |digit| result += COLOR_HASH[digit.to_sym] }
    result
  end
end
