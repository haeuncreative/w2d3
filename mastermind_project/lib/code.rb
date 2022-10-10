require 'byebug'

class Code

  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all? {|char| POSSIBLE_PEGS.include?(char.upcase)}
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map {|char| char.upcase}
    else
      raise 'pegs not valid'
    end
  end

  def self.random(length)
    arr = POSSIBLE_PEGS.keys
    randoms = Array.new
    length.times { randoms << arr.sample}
    Code.new(randoms)
  end

  def self.from_string(str)
    chars = str.split("")
    Code.new(chars)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count = 0
    code.pegs.each_with_index do |peg, i|
      if code[i] == @pegs[i]
        count += 1
      end
    end
    count
  end

  def num_near_matches(code)
    count = 0 
    color_hash = make_hash(@pegs)
    dup_hash = make_hash(code.pegs)
    og_leftovers = Array.new
    input_leftovers = Array.new

    color_hash.each do |peg, num|
      if dup_hash.keys.include?(peg)
        sub_count = color_hash[peg] - dup_hash[peg]
        if sub_count <= 0
          count += color_hash[peg]
        else
          count += sub_count
        end
      end
    end

    count - num_exact_matches(code)
  end

  def make_hash(pegs)
    hash = Hash.new(0) #{|h,k| h[k] = Array.new(0)}
    pegs.each_with_index do |peg|
      hash[peg] += 1
    end
    hash
  end

  def ==(code)
    if code.pegs == @pegs
      return true
    end
      return false
  end

end
