require_relative "room"

class Hotel
  def initialize(name, rooms) 
    @name = name
    @rooms = {}
    rooms.each do |name, capacity|
        @rooms[name] = Room.new(capacity)
    end
  end

  def name
    words = @name.split
    words.map {|word| word.capitalize}.join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(name)
    @rooms.has_key?(name)
  end

  def check_in(person, room_name)
    unless room_exists?(room_name)
        print "sorry, room does not exist"
    else 
        if rooms[room_name].add_occupant(person)
            print "check in successful"
        else
            print "sorry, room is full"
        end
    end
  end

    def has_vacancy?
        rooms.values.any? {|room| !room.full?}
    end

    def list_rooms
        rooms.each do |room_name, room|
            print "#{room_name}.*#{room.available_space}\n"
        end
    end

end
