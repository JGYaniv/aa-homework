require_relative 'card.rb'

class Board
    attr_accessor :grid

    def initialize(size)
        @grid = Array.new(size) { Array.new(size) }
    end

    def random_stuff
        stuff = []
        (0..9).each do |num|
            stuff << num
        end

        ("a".."z").each do |letter|
            stuff << letter
        end

        stuff #[0,1,2,3..a,b,c,...]
    end

    def random_empty_position
        empty_positions = [] #[[0,0],[0,1],[0,2]...]

        @grid.each_with_index do |row, row_idx|
            row.each_with_index do |ele, ele_idx|
                if ele == nil
                    empty_positions << [row_idx, ele_idx]
                end
            end
        end

        empty_positions.sample
    end

    def assign_pairs(elements) # elements => [a, 1, 0, c, 5...]
        elements.each do |ele|
            2.times do
                position = random_empty_position #@grid[2, 2] = Card.new(ele)
                row, col = position
                @grid[row][col] = Card.new(ele) ##<Card:0x00007f8e61834b80 @face_value="6", @revealed=false>
            end
        end
    end 

    def randomize
        pair_count = @grid.length ** 2 / 2 #assuming an even board size
        elements = []
        stuff = random_stuff #random_stuff returns an array of random stuff!

        while elements.length < pair_count
            element = stuff.sample
            unless elements.include?(element)
                elements << element #element => "a" || 1
            end
        end

        assign_pairs(elements)
    end

    def reveal(pos) # pos => [row_idx, el_idx]
        row, col = pos
        @grid[row][col].reveal # => true or false
    end

    def won?
        @grid.all? do |row| #checks every subarray of the @grid 2D array
            row.all? do |card|
                card.revealed #=> true if revealed, otherwise false and row.all? returns false to @grid.all? which returns false to won?
            end
        end
    end

    def render
        system("clear")

        @grid.each do |row|
            rendered_row = row.map {|card| render_card(card)}
            puts rendered_row.join(" ")
        end

        true
    end

    def render_card(card)
        if card.revealed
            return card.to_s
        else
            return "-"
        end
    end
end