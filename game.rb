class Game
  attr_accessor :teams

  def initialize
    pieces = (1..12).to_a
    @teams = Hash.new
    ["red", "white"].each do |name|
      @teams[name] = {}
      pieces.each do |n|
        @teams[name][n] = {:x=>1, :y=>2}
      end
    end
  end
end