class Game
  attr_accessor :teams

  def initialize
    @teams = Hash.new
    setup = {}
    setup["white"] = [[1,1],[3,1],[5,1],[7,1],[2,2],[4,2],[6,2],[8,2],[1,3],[3,3],[5,3],[7,3]]
    setup["red"] = [[2,6],[4,6],[6,6],[8,6],[1,7],[3,7],[5,7],[7,7],[2,8],[4,8],[6,8],[8,8]]
    setup.each do |key, value|
      @teams[key] = {}
      value.each_with_index do |coordinates, index|
        @teams[key][index+1] = {:x=>coordinates.first, :y=>coordinates.last}
      end
    end
  end
end