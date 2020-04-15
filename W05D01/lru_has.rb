require 'byebug'
class LRUCache
    def initialize(n)
        @max_size = n
        @hash_map = {}
        @head = LinkedList.new("head")
        @head.head = true
    end

    def count
    # returns number of elements currently in cache
        @hash_map.length
    end

    def add(el)
    # adds element to cache according to LRU principle
        current_link = @head
        remove(el)
        if @hash_map.length == @max_size
            @head.delete
        end
        tail.next = LinkedList.new(el)
        @hash_map[el] = current_link.next
    end

    def show
    # shows the items in the cache, with the LRU item first
        p @hash_map.keys
    end

    private
    # helper methods go here!
    def remove(el)
        link_el = find(el)
        link_el.delete if link_el
    end

    def find(el)
        @hash_map[el]
    end

    def tail
        link = @head
        while true
            return link if link.next.nil?
            link = link.next
        end
    end
end


class LinkedList
    attr_accessor :name, :prev, :next, :head, :tail

    def initialize(name)
        @name = name
        @prev = nil
        @next = nil
        @head = false
        @tail = false
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