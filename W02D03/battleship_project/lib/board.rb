require 'byebug'

class Board
    def initialize(n)
        @grid = Array.new(n){Array.new(n, :N)}
        # @grid = (0...n).map do |col|
        #           (0...n).map do |row|
        #               :N
        #           end
        #          end
        @size = n * n
    end

    def size
        @size
    end

    def [](coordinates) #board_instance[[row, col]]
        row_idx, col_idx = coordinates
        @grid[row_idx][col_idx]
    end
    # .[]([0,1])
    # [[0,1]]

    def []=(coordinates, value)
        row_idx, col_idx = coordinates 
        @grid[row_idx][col_idx] = value
    end

    def num_ships
        count = 0

        @grid.each do |row|
            row.each do |ele|
                count += 1 if ele == :S
            end
        end

        count
    end

    def attack(coordinates)
        row_idx, col_idx = coordinates 
        if self[coordinates] == :S
            self[coordinates] = :H
            p "you sunk my battleship!"
            true
        else 
            self[coordinates] = :X
            false
        end
    end

    def place_random_ships
        num_ships = self.size / 4
        while num_ships > 0
            random_row_idx = rand(0...@grid.length) #gets random row index
            random_col_idx = rand(0...@grid.length) #gets random col index
            # pos = [random_row_idx, random_col_idx]

            if @grid[random_row_idx][random_col_idx] != :S # @grid1[0][1] = [[0,1,2][0,1,2]] self[pos]
                @grid[random_row_idx][random_col_idx] = :S # @grid2 = [[0,1,2][0,1,2]] self[pos]
                num_ships -= 1
            end
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |space| 
                if space == :X
                    :X
                elsif space == :H
                    :H
                else
                    :N
                end
            end
        end 
    end

    def self.print_grid(grid)  
        grid.each do |row|
            print row.map {|ele| ele.to_s }.join(" ") + "\n"
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
