class User < Player
  def make_code
    result = nil
    result = get_input("Please enter a code: ").upcase until valid_code?(result)
    @code = result
  end

  def make_guess
    result = nil
    result = get_input("> ").upcase until valid_code?(result)
    @guess = result
  end

  private

  def valid_code?(code)
    return false if code == nil

    unless code.length == 4
      puts "Code must be 4 letters long"
      return false
    end

    code.each_char do |char|
      unless COLOR_HASH.has_value?(char)
        puts "#{char} is not a valid color"
        return false
      end
    end

    true
  end
end
