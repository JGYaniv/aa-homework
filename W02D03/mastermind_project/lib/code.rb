class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    pegs.all? {|el| POSSIBLE_PEGS.include?(el.upcase)}
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map{|peg| peg.upcase }
    else
      raise "invalid pegs"
    end
  end

  def pegs
    @pegs
  end

  def self.random(length)
    pegs = POSSIBLE_PEGS.keys
    random_pegs = []
    length.times do
      a_peg = pegs.sample
      random_pegs << a_peg
    end
    
    Code.new(random_pegs)
  end

  def self.from_string(string)
    code = string.split("")
    Code.new(code)
  end

  def [](index)
    self.pegs[index]
  end

  def length
    self.pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    guess.pegs.each_with_index do |peg, idx|
      if self.pegs[idx] == peg
        count += 1

      end
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    guess.pegs.each_with_index do |peg, idx|
      if self.pegs.include?(peg) && !(self.pegs[idx] == peg)
        count += 1
      end
    end
    count
  end

  


  def ==(code)
    self.pegs == code.pegs
  end
end
