class ComputerPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        sleep(1.1)
        chosen = legal_positions.sample
        print "\ndumb_ai #{@mark} goes: #{chosen}\n"
        return chosen
    end
end