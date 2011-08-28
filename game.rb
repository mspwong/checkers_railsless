class Game

  def initialize
    # @teams is a hash with this structure:  { team_name => { piece_num => [x_coordinate, y_coordinate] } }
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
                                (new_position.first.is_a? Integer)  && (VALID_COORDINATES.include? new_position.first)  &&
                                (new_position.last.is_a? Integer)  && (VALID_COORDINATES.include? new_position.last) )

    validate_immediate_forward_diagonal! piece, new_position
    validate_not_occupied! new_position

    @teams[piece[:team]][piece[:piece_num]] = new_position
  end

  def position(piece)
    @teams[piece[:team]][piece[:piece_num]]
  end

  private

  VALID_COORDINATES = (1..8).to_a

  def validate_immediate_forward_diagonal!(piece, new_position)
    p = position(piece)
    current_x = p.first
    current_y = p.last
    if piece[:team] == :white
      raise ValidationError.new("must only move to a position immediately forward and diagonal") unless (new_position.last == current_y+1)  &&  ((new_position.first == current_x+1)  || (new_position.first == current_x-1))
    elsif piece[:team] == :red
      raise ValidationError.new("must only move to a position immediately forward and diagonal") unless (new_position.last == current_y-1)  &&  ((new_position.first == current_x+1)  || (new_position.first == current_x-1))
    else
      raise ArgumentError("unknown team:  #{piece[:team]}")
    end
  end

  def validate_not_occupied!(new_position)
    raise ValidationError.new("must not move to a position that is already occupied") if @teams.values.any? do |pieces|
      pieces.values.include? new_position
    end
  end

end



class ValidationError < StandardError
end