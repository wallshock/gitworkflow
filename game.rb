require './board'
require './tile'
class Game
    attr_reader :board
    def initialize
        @board = Board.new("sudoku1_almost.txt")
    end

    def play
        while !@board.solved
            @board.printboard
            guess = self.prompt
            while !valid?(guess)
                guess = self.prompt
            end
            @board.makechanges(guess)
        end
        @board.printboard
        puts 'You solved it!'
    end

    def valid?(guess)
        return true if @board.grid[guess[0].to_i][guess[2].to_i].adaptable == true
        return false
    end


    def prompt
        print "Pick a position and a number e.g. 0 0 5 -> "
        guess = gets.chomp
    end
    
end

if __FILE__ == $PROGRAM_NAME
    gra = Game.new
    gra.play
    
end