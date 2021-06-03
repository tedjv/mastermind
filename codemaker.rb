# Allow the computer to try and break the player's code using binary search
class ComputerBreaks
    @@guess_count = 0 

    def initialize
        intro_message
        game_loop
    end

    def game_loop
        input_player_code
        generate_guess
    end

    def intro_message
        puts "Hello, I will attempt to crack your 4-digit code. Please use numbers 1 - 6 to form your code."
    end

    def input_player_code
        @code = gets.to_i
    end
    
    def generate_guess
        possible_codes = Array(1111..6666)

        low = 0
        high = possible_codes.size - 1

        while low <= high
            mid = (low + high) / 2
            guess = possible_codes[mid]
            @@guess_count += 1
            puts "Guess ##{@@guess_count}: #{guess}?"
            sleep(1)

        if guess == @code
            then puts "The computer cracked your code! Game over."
            exit
        
        elsif @@guess_count == 12 
            then puts "The computer could not crack your code! You win! Game over."
            exit
    
        elsif guess > @code
            then high = mid - 1
            
        else
            low = mid + 1
        end
    end
end
end

