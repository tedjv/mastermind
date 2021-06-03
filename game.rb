require_relative 'codebreaker.rb'
require_relative 'codemaker.rb'

# Choose between playing as the code-maker or code-breaker
class ChooseGame
    def initialize
        puts "Welcome to Master Mind!"
        choose_side
    end

    def choose_side
        puts "Enter 1 to play as the code breaker, enter 2 to play as the code maker: "
        choice = gets.to_i
        
        if choice == 1
            then PlayerBreaks.new
        end

        if choice == 2
            then ComputerBreaks.new
        end
    end
end

ChooseGame.new