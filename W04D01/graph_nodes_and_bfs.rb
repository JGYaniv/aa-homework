require 'byebug'
class GraphNode
    attr_reader :name, :neighbors
    def initialize(name)
        @name = name
        @neighbors = []
    end

    def neighbors=(all_neighbors)
        @neighbors = all_neighbors
    end
end

def bfs(starting_node, value)
    queue = [starting_node]
    until queue.empty?
        next_in_line = queue.shift
        return next_in_line if next_in_line.name == value

        next_in_line.neighbors.each do |neighbor|
            queue << neighbor unless neighbor == starting_node
        end
    end
end

if __FILE__ == $PROGRAM_NAME
    a = GraphNode.new('a')
    b = GraphNode.new('b')
    c = GraphNode.new('c')
    d = GraphNode.new('d')
    e = GraphNode.new('e')
    f = GraphNode.new('f')
    a.neighbors = [b, c, e]
    c.neighbors = [b, d]
    e.neighbors = [a]
    f.neighbors = [e]
    p bfs(a, "a").name
    p bfs(a, "b").name
    p bfs(a, "d").name
    p bfs(e, "d").name
    p bfs(a, "f")
end