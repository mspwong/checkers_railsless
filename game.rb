class Game
  attr_accessor :teams    # { team_name => { piece_num => [x_coordinate, y_coordinate] } }

  def initialize
    @teams = Hash.new
    { :white => [[1,1],[3,1],[5,1],[7,1],[2,2],[4,2],[6,2],[8,2],[1,3],[3,3],[5,3],[7,3]],
      :red => [[2,6],[4,6],[6,6],[8,6],[1,7],[3,7],[5,7],[7,7],[2,8],[4,8],[6,8],[8,8]] }.each do |key, value|
      @teams[key] = {}
      value.each_with_index do |coordinates, index|
        @teams[key][index+1] = [coordinates.first, coordinates.last]
      end
    end
  end

  def move(piece, new_position)
    raise ArgumentError unless ( new_position.size == 2  &&
                                (new_position[:x].is_a? Integer)  && (VALID_COORDINATES.include? new_position[:x])  &&
                                (new_position[:y].is_a? Integer)  && (VALID_COORDINATES.include? new_position[:y]) )
    raise RuntimeError if !immediate_forward_and_diagonal(piece, new_position)  ||  occupied(new_position)
  end

  private

  VALID_COORDINATES = (1..8)

  def position(piece)
    teams[piece[:team]][piece[:piece_num]]
  end

  def immediate_forward_and_diagonal(piece, new_position)
    p = position(piece)
    x = p.first
    y = p.last
    if piece[:team] == :white
      (new_position[:y] == y+1)  &&  ((new_position[:x] == x+1)  || (new_position[:x] == x-1))
    elsif piece[:team] == :red
      (new_position[:y] == y-1)  &&  ((new_position[:x] == x+1)  || (new_position[:x] == x-1))
    else
      raise RuntimeError("unknown team:  #{piece[:team]}")
    end
  end

  def occupied(new_position)
    occupied = false
    teams.each_value do |pieces|
      occupied = pieces.values.include? [new_position[:x], new_position[:y]]
      break if occupied
    end
    occupied
  end

end