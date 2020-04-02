require_relative "./item.rb"

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(item, deadline, description="")
        if Item.valid_date?(deadline)
            item = Item.new(item, deadline, description)
            @items << item
            true
        else
            false
        end
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        idx < self.size && idx >= 0 
    end

    def swap(index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            true
        else
            false
        end
    end

    def [](idx)
        if valid_index?(idx)
            @items[idx]
        else
            nil
        end
    end

    def priority
        print_full_item(0)
    end

    def my_print 
        dashes_num = 20
        print_dashes(dashes_num)
        puts @label.upcase
        print_dashes(dashes_num)
        print "Index| Item| Deadline | Completed\n"
        print_dashes(dashes_num)

        @items.each.with_index do |item, i|
            print "#{i}   |   #{item.title} | #{item.deadline} | #{item.done} \n"
        end
        
        print_dashes(dashes_num)
    end

    def print_dashes(num)
        num.times{ print"-" }
        puts ""
    end

    def print_full_item(index)
        if valid_index?(index)
            num_dashes = 20
            print_dashes(num_dashes)
            item = self[index]
            print "#{item.title} | #{item.deadline} | #{item.done} \n#{item.description}\n" 
            print_dashes(num_dashes)
        end
    end

    def up(index, amount=1) # index=3, amount=10
        if index != 0 && valid_index?(index)
            i = 0 # 2
            head = index #1
            while i < amount && head-1 >= 0
                swap(head, head-1)
                head -= 1
                i += 1
            end
            true
        else
            false
        end
    end

    def down(index, amount=1)
        if index != @items.length-1 && valid_index?(index)
            i = 0
            tail = index
            while i < amount && tail+1 < @items.length
                swap(tail, tail+1)
                tail += 1
                i += 1
            end
            true
        else
            false
        end
    end

    def sort_by_date!
        @items.sort_by!{|item| item.deadline}
    end

    def toggle_item(idx)
        @items[idx].toggle
    end

    def remove_item(idx)
        @items.delete_at(idx)
    end

    def purge
        @items.select! {|item| !item.done}
    end

end
