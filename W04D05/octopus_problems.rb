# A Very Hungry Octopus wants to eat the longest fish in an array of fish.

fishies = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"
# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths

def sluggish_octopus(fishies)
    biggest_fish = nil
    fishies.each_with_index do |fish1|
        fishies.each_with_index do |fish2|
            biggest_fish ||= fish1
            if fish1.length > biggest_fish.length
                biggest_fish = fish1
            elsif fish2.length > biggest_fish.length
                biggest_fish = fish2
            end
        end
    end
    biggest_fish
end

p sluggish_octopus(fishies)

# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Complexity Demo. Remember that Big O is classified by the dominant term.

def dominant_octopus(fishies)
    sorted_fishes = merge_sort(fishies){|f1,f2| f1.length <=> f2.length}
    sorted_fishes.last
end

def merge_sort(arr, &prc)
    return arr if arr.length < 2
    mid_idx = arr.length/2
    left = merge_sort(arr[0...mid_idx], &prc)
    right = merge_sort(arr[mid_idx..-1], &prc)
    merge(left, right, &prc)
end

def merge(arr1, arr2, &prc)
    merged = []
    until arr1.empty? || arr2.empty?
        if prc.call(arr1.first, arr2.first) == -1
            merged << arr1.shift
        else
            merged << arr2.shift
        end
    end
    merged + arr1 + arr2
end

p dominant_octopus(fishies)

# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.

def clever_octopus(fishies)
    biggest_fish = fishies.first
    (1...fishies.length).each do |idx|
        biggest_fish = fishies[idx] if fishies[idx].length > biggest_fish.length
    end
    biggest_fish
end

p clever_octopus(fishies)

# Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding tentacle. We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.

# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.


def slow_dance(target, tiles_array)
    tiles_array.each_with_index do |tile, tentacle|
        return tentacle if tile == target
    end
end

p slow_dance("up", tiles_array)
# > 0

# slow_dance("right-down", tiles_array)
# > 3
# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.

new_tiles_data_structure = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7 }

def fast_dance(target, new_tiles_data_structure)
    new_tiles_data_structure[target]
end
p fast_dance("up", new_tiles_data_structure)
# > 0

p fast_dance("right-down", new_tiles_data_structure)
# > 3