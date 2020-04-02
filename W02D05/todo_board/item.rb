require 'date'

class Item
    attr_reader :deadline, :done
    attr_accessor :title, :description
    def self.valid_date?(date_string)
        begin
            #1912-06-23 YYYY-MM-DD
            Date.parse(date_string)
            true
        rescue
            false
        end
    end

    def initialize(title, dead_line, description)
        @title = title
        self.deadline = dead_line
        @description = description
        @done = false
    end

    def deadline=(deadline)
        if Item.valid_date?(deadline)
            @deadline = deadline 
        else
            raise "deadline is not valid"
        end
    end

    def toggle
      @done  = !@done
    end
end