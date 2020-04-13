require 'byebug'
class LRUCache
    def initialize(n)
        @max_size = n
        @cache_map = {}
        @head = LinkedList.new("head")
    end

    def count
    # returns number of elements currently in cache
        @cache_map.length
    end

    def add(el)
    # adds element to cache according to LRU principle
        current_link = @head
        tail = (current_link.next ? false : true)
        until tail
            current_link = current_link.next
            tail = (current_link.next ? false : true)
        end

        if @max_size == count
            @cache_map.delete(@head.name)
            @head, @head.next = @head.next, nil
        end
        current_link.next = LinkedList.new(el)
        @cache_map[el] = current_link.next
    end

    def show
    # shows the items in the cache, with the LRU item first
        p @cache_map.keys
    end

    private
    # helper methods go here!

end


class LinkedList
    attr_accessor :name, :prev, :next

    def initialize(name)
        @name = name
        @prev = nil
        @next = nil
    end

    def delete
        if @prev && @next
            @prev.next, @next.prev = @next, @prev
        elsif @prev
            @prev.next = @next
        elsif @next
            @next.prev = @prev
        end
    end
end


johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
# p johnny_cache