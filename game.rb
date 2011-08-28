class Game
  attr_accessor :teams

  def initialize
    pieces = (1..12).to_a
    @teams = Hash.new
    ["red", "white"].each do |name|
      @teams[name] = {}
      [[1,1],[3,1],[5,1],[7,1],[2,2],[4,2],[6,2],[8,2],[1,3],[3,3],[5,3],[7,3]].each_with_index do |coordinates, index|
        @teams[name][index+1] = {:x=>coordinates.first, :y=>coordinates.last}
      end
    end
  end
end