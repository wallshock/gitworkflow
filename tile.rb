class Tile
    attr_reader :adaptable
    attr_accessor :num
    def initialize(num)
        @num = num
        if num == "0"
            @adaptable = true
        else
            @adaptable = false
        end
    end

    def ===(value)
        if @adaptable == true
            @num = value
        else
            puts "You cannot change given numbers"
        end
    end
end