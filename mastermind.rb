# Generate CPU code
module ComputerCode
  CODE = rand(1111..6666)
end

# Allow human to guess code
class HumanGuess
  include ComputerCode
  @@guess_count = 0

  def initialize
      puts CODE
      puts "You have 12 chances to crack the computer's 4-digit code."
      until @@guess_count == 12
          
          puts "Enter your 4-digit guess: "
          @guess = gets.to_i

          @@guess_count += 1

          if CODE == @guess then puts "Code cracked! You win!"
              break
          end

          trigger_match_clues()
          trigger_inclusion_clues()
      end
  end

  def trigger_match_clues
      # Transform the computer's code and the player's guesses into arrays to compare digits and trigger clues for matching numbers in the correct position
      guess_array = @guess.digits.reverse
      code_array = CODE.digits.reverse

      positional_matches = 0
      index = 0
      p guess_array
      p code_array
      # Loop through the index of each array and compare each element to trigger clues
      until index == 4
          if guess_array[index] == code_array[index]
              then positional_matches += 1
          end
          index += 1
      end

      puts "#{positional_matches} matching numbers in the correct position."
  end

  def trigger_inclusion_clues
      # Transform the computer's code and the player's guesses into arrays to compare digits and trigger clues for matching numbers
      guess_array = @guess.digits.reverse
      code_array = CODE.digits.reverse

      correct_numbers = 0

      # Trigger a correct number clue if the code array contains any numbers found in the guess array
      guess_array.each do |number| 
          if code_array.include?(number)
              correct_numbers += 1
          end
      end
      
      puts "#{correct_numbers} matching numbers."
  end
end

HumanGuess.new