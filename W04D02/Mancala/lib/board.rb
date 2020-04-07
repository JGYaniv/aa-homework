class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      unless idx == 6 || idx == 13
        4.times{cup << :stone}
      end
    end
  end

  def valid_move?(start_pos)
    unless start_pos.is_a?(Integer) &&
      start_pos >= 0 &&
      start_pos < 14
      raise "Invalid starting cup"
    end
    if @cups[start_pos].empty?
      raise 'Starting cup is empty'
    end
  end

  def make_move(start_pos, current_player_name)
    hand = []
    num = @cups[start_pos].length
    num.times{hand << @cups[start_pos].pop}
    until hand.empty?      
      start_pos += 1
      start_pos %= 14
      unless current_player_name == @name1 && start_pos == 13 || current_player_name == @name2 && start_pos == 6
        @cups[start_pos] << hand.pop
      end
    end
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    render
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].empty?
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all?(&:empty?)
    return true if @cups[7..12].all?(&:empty?)
    false
  end

  def winner
    case @cups[6].count <=> @cups[13].count
    when 1
      return @name1
    when -1
      return @name2
    when 0
      return :draw
    end
  end
end
