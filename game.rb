include Utilities

class Game
  def initialize(computer, user)
    @computer = computer
    @user = user
  end

  def play_game
    num_rounds = get_num_rounds
    puts
    display_rules
    num_rounds.times do |num|
      puts "Round #{num + 1}"
      play_round
      puts
    end

    winner = get_winner
    if winner == nil
      puts "This game was a draw"
    else
      puts "#{winner.name} wins with #{winner.num_wins} points"
    end

    play_game if get_input("Play again? (Y/N): ").upcase == "Y"
  end

  private

  attr_reader :code_maker, :code_breaker, :computer, :user

  def get_num_rounds
    num_rounds = nil
    loop do
      num_rounds = get_input("Enter the number of rounds you want to play: ").to_i
      break if num_rounds % 2 == 0

      puts "Number of rounds has to be even"
    end
    num_rounds
  end

  def play_round
    assign_roles
    puts
    code_maker.make_code
    puts
    guess_history = Hash.new
    8.times do |count|
      code_breaker.make_guess
      evaluation = evaluate_guess
      guess_history[code_breaker.guess] = evaluation
      if evaluation[0] == 4
        puts "#{code_breaker.name} guessed right!!"
        puts
        code_breaker.increase_wins
        break
      else
        puts
        display_history(guess_history)
        if count < 7
          puts "#{7 - count} tries left"
        else
          puts
          puts "#{code_maker.name} wins\n" +
               "The code was #{code_maker.code}"
          code_maker.increase_wins
        end
        puts
      end
    end
  end

  def assign_roles
    input = get_input("Choose your role (1 for Code Maker and 2 for Code Breaker): ")
    until input == "1" || input == "2"
      input = get_input("Please enter '1' or '2': ")
    end

    if input == '1'
      @code_maker = user
      @code_breaker = computer
    else
      @code_maker = computer
      @code_breaker = user
    end
  end

  def evaluate_guess
    guess_array = code_breaker.guess.split("")
    @temp_code_array = code_maker.code.split("")
    result = []
    result.push(get_black_balls(guess_array))
    result.push(get_white_balls(guess_array))
    result
  end

  def get_winner
    if code_maker.num_wins == code_breaker.num_wins
      nil
    elsif code_maker.num_wins > code_breaker.num_wins
      code_maker
    else
      code_breaker
    end
  end

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
