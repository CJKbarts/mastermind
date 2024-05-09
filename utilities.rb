module Utilities
  def display_welcome
    puts "Welcome To Mastermind"
    puts
  end

  def display_rules
    puts "Computer randomly picks a sequence of 4 colors from the colors:"
    puts "Red, Orange, Yellow, Green, Blue, Indigo, Violet, Pink"
    puts

    puts "To beat the game, players must guess the color using 6 tries"
    puts "After each guess you would be informed of the number of black ball and white balls"
    puts "Number of black balls shows how many colors were guessed right and are in the right spot"
    puts "Number of black balls shows how many colors were guessed right but are in the wrong spot"
    puts

    puts "Enter your guesses as a string of the initials of the colors in the sequence"
    puts "START"
    puts
  end

  def display_feedback(array)
    puts "Black balls: #{array[0]}"
    puts "White balls: #{array[1]}"
  end

  def get_input(prompt)
    print prompt
    gets.chomp
  end
end
