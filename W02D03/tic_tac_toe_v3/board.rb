class Board
    def initialize(n)
        @grid = (0...n).map do |row|
            (0...n).map {|el| "_" }
        end
    end

    def valid?(pos) #[row, col]
        @grid[pos.first][pos.last] ? true : false
    end

    def empty?(pos)
        @grid[pos.first][pos.last] == "_"
    end

    def place_mark(pos, mark)
        if valid?(pos) && empty?(pos)
            @grid[pos.first][pos.last] = mark
        else
            raise "stfu"
        end
    end

    def print
        system("clear")
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            return true if row.all?{|el| el == mark }
        end
        false
    end

    def win_col?(mark)
        @grid.transpose.each do |row|
            return true if row.all?{|el| el == mark }
        end
        false
    end

    def check_forward_slash(mark)
        row, col = 0, 0
        (0...@grid.length).to_a.each do |i|
            return false unless @grid[row+i][col+i] == mark
        end
        true
    end

    def check_back_slash(mark)
        row, col = 0, @grid.length-1
        @grid.length.times do |i|
            return false unless @grid[row+i][col-i] == mark
        end
        true
    end

    def win_diagonal?(mark)
        check_forward_slash(mark) || check_back_slash(mark)
    end
    
    def win?(mark)
        win_diagonal?(mark) || win_row?(mark) || win_col?(mark)
    end

    def empty_positions?
        @grid.each do |row|
            return true if row.any?{|el| el == "_" }
        end

        false
    end

    def legal_positions
        if empty_positions?
            positions = []
            @grid.each_with_index do |row, row_idx|
                row.each_with_index do |el, el_idx|
                    positions << [row_idx, el_idx] if el == "_"
                end
            end

            return positions
        end
    end
end