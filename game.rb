include Utilities

class Game
  def initialize(code_maker, code_breaker)
    @code_maker = code_maker
    @code_breaker = code_breaker
  end

  def play_game
    print "Enter the number of rounds you want to play: "
    num_rounds = gets.chomp.to_i
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

  attr_reader :code_maker, :code_breaker

  def play_round
    code_maker.make_code
    6.times do |count|
      code_breaker.make_guess
      evaluation = code_maker.evaluate_guess(code_breaker.guess)
      if evaluation[0] == 4
        puts "#{code_breaker.name} guessed right!!"
        puts
        code_breaker.increase_wins
        break
      else
        display_feedback(evaluation)
        if count < 5
          puts "#{5 - count} tries left"
          puts
        else
          puts
          puts "#{code_maker.name} wins"
          puts "The code was #{code_maker.code}"
          puts
          code_maker.increase_wins
        end
      end
    end
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
end
