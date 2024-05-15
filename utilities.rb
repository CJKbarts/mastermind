module Utilities
  def display_welcome
    puts "Welcome To Mastermind"
    puts
  end

  def display_rules
    puts "Rules of the Game"
    puts "Code maker create a sequence of 4 colors from the colors:"
    puts "Red, Orange, Yellow, Green, Blue, Indigo"
    puts

    puts "To beat the game, code breakers must guess the color using 6 tries"
    puts "After each guess,code breakers would be informed of the number of " +
         "black and white balls they obtained"
    puts "Black balls show how many colors were guessed right and are in the right spot"
    puts "White balls show how many colors were guessed right but are in the wrong spot"
    puts

    puts "Enter your codes and guesses as strings of the initials of the colors in the sequence"
    puts "Example: ROYG would be a sequence of Red, Orange, Yellow, and Green"
    puts "START"
    puts
  end

  def display_history(guess_history)
    guess_history.each do |guess, feedback|
      print "#{guess} - "
      display_feedback(feedback)
      puts
    end
  end

  def display_feedback(feedback)
    feedback[0].times { print "B" }
    feedback[1].times { print "W" }
  end

  def get_input(prompt)
    print prompt
    gets.chomp
  end
end
