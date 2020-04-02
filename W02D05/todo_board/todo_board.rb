require_relative './list.rb'

class TodoBoard
    def initialize(label)
        @label = label
        @list_hash = {}
        list = List.new(label)
        @list_hash[label] = list
    end

    def get_command
        puts "Please enter your command: "
        command, label, *args = gets.chomp.split(" ")
        
        case command
        when 'mklist'
            @list_hash[label] = List.new(label)
        when 'mktodo'
            @list_hash[label].add_item(*args)
        when 'up'
            @list_hash[label].up(*args.map(&:to_i))
        when 'down'
            @list_hash[label].down(*args.map(&:to_i))
        when 'swap'
            @list_hash[label].swap(*args.map(&:to_i))
        when 'sort'
            @list_hash[label].sort_by_date!
        when 'priority'
            @list_hash[label].priority
        when 'print' #print 4
            if args.length == 0
                @list_hash[label].my_print
            else
                @list_hash[label].print_full_item(args[0].to_i)
            end
        when 'toggle'
            @list_hash[label].toggle_item(args[0].to_i)
        when 'purge'
            @list_hash[label].purge
        when 'rm'
            @list_hash[label].remove_item(args[0].to_i)
        when 'quit'
            return false
        when 'ls'
            puts @list_hash.keys
        when "showall"
            @list_hash.values.each {|list| list.my_print }
        else
            puts "Sorry, that command is not recognized. =("
        end

        true
    end 

    def run
        while get_command

        end
    end
end
