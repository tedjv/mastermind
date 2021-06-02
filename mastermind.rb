# Generate and store the computer's code
module ComputerCode
    CPU_CODE = rand(1111..6666).digits.reverse
end

# Allow the user to play as the codebreaker
class PlayerBreaks
    include ComputerCode
    @@guess_count = 0

    def initialize
        p CPU_CODE
        intro_message
        game_loop
    end

    def game_loop
        until @@guess_count == 12
            get_guess
            p @guess
            increment_guess_counter
            check_for_win
            display_matching_number_clues
            display_correct_number_clues

            if @@guess_count == 9
                then three_guesses_left_warning
            end
        end
        game_over
    end

    def intro_message
        puts "You have 12 chances to crack the computer's 4-digit code. Usable numbers include 1 - 6"
    end

    def get_guess
        puts "Please enter your guess: "
        @guess = gets.to_i.digits.reverse
    end

    def increment_guess_counter
        @@guess_count += 1
    end

    def check_for_win
        if @guess == CPU_CODE 
            then puts "Code cracked! You win!"
            exit
        end
    end

    def display_matching_number_clues
        positional_matches = 0
        index = 0

        until index == 4
            if @guess[index] == CPU_CODE[index]
                then positional_matches += 1
            end
            index += 1
        end

        puts "#{positional_matches} matching numbers are in the correct position."
    end

    def display_correct_number_clues
        correct_numbers = 0

        @guess.each do |number|
            if CPU_CODE.include?(number)
                correct_numbers += 1
            end
        end

        puts "#{correct_numbers} matching numbers."
    end

    def three_guesses_left_warning
        puts "You have 3 guesses left!"
    end

    def game_over
        puts "You didn't crack the code! Game over."
    end
end

PlayerBreaks.new