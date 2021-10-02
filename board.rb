require './tile'
require 'colorize'
class Board
        attr_reader :board, :grid
        def initialize(file)
            @board = File.open(file, "r")
            @grid = Array.new(9) {Array.new(9)}
            self.fillboard
        end

        

        def fillboard
            @board.each.with_index do |row,i|
                row.chomp.each_char.with_index do |num,j|
                    @grid[i][j] = Tile.new(num)
                end
            end    
        end

        def printboard
            @grid.each.with_index do |row,i|
                row.each.with_index do |tile,j|
                    if tile.adaptable == false
                        print tile.num.rjust(3)
                    else
                        print tile.num.rjust(3).red
                    end
                end
                puts
            end    
        end

        def solved
            @grid.each.with_index do |row,i|
                row.each.with_index do |col,j|
                    return false if !checkcol(j)
                end
                return false if !checkrow(i)
            end
            return true
        end

        def makechanges(guess)
            @grid[guess[0].to_i][guess[2].to_i] === guess[4]
        end

        def checksquare(row,col)
        end

        def checkrow(row)
            temp = []
            (0...@grid.size).each do |j|
                temp << @grid[row][j].num
            end
            return true if temp.uniq.size == temp.size && !temp.include?("0")
            return false
        end

        def checkcol(col)
            temp = []
            (0...@grid.size).each do |i|
                temp << @grid[i][col].num
            end
            return true if temp.uniq.size == temp.size && !temp.include?("0")
            return false
        end
end


