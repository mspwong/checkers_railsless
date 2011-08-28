require "rspec"
require File.dirname("__FILE__") + "/game"

describe "Checker game:  " do

  describe "move" do
    before(:each) do
      @game = Game.new
      @piece = {:team => :white, :piece_num => 12}
      @x, @y = @game.position(@piece).first, @game.position(@piece).last
    end

    describe "to invalid square" do
      it "results in exception" do
        lambda { @game.move(@piece, [3.5, @y]) }.should raise_error(ArgumentError)
        lambda { @game.move(@piece, [3.5, 3.5]) }.should raise_error(ArgumentError)
        lambda { @game.move(@piece, [@x, -1]) }.should raise_error(ArgumentError)
        lambda { @game.move(@piece, [-1, @y]) }.should raise_error(ArgumentError)
        lambda { @game.move(@piece, [0, @y]) }.should raise_error(ArgumentError)
        lambda { @game.move(@piece, [@x, 0]) }.should raise_error(ArgumentError)
        lambda { @game.move(@piece, ["does not matter", @y]) }.should raise_error(ArgumentError)
        lambda { @game.move(@piece, [@x, 9]) }.should raise_error(ArgumentError)
        lambda { @game.move(@piece, [9, @y]) }.should raise_error(ArgumentError)
        lambda { @game.move(@piece, [9, 9]) }.should raise_error(ArgumentError)
      end
    end

    describe "to light colored square" do
      it "results in exception" do
        lambda { @game.move(@piece, [4, 4]) }.should raise_error(RuntimeError)
      end
    end

    describe "to horizontally adjacent (side way) square" do
      it "results in exception" do
        lambda { @game.move(@piece, [8, 3]) }.should raise_error(RuntimeError)
      end
    end

    describe "to vertically adjacent (up or down) square" do
      it "results in exception" do
        lambda { @game.move(@piece, [7, 4]) }.should raise_error(RuntimeError)
      end
    end

    describe "backward" do
      describe "by a red piece" do
        it "results in exception" do
          piece = {:team => :red, :piece_num => 4}
          x, y = @game.position(piece).first, @game.position(piece).last
          lambda { @game.move(piece, [x-1, y+1]) }.should raise_error(RuntimeError)
        end
      end

      describe "by a white piece" do
        it "results in exception" do
          lambda { @game.move(@piece, [@x, @y-1]) }.should raise_error(RuntimeError)
        end
      end
    end

    describe "forward by more than 1 diagonal" do
      it "results in exception" do
        lambda { @game.move(@piece, [5, 5]) }.should raise_error(RuntimeError)
      end
    end

    describe "to square" do
      describe "occupied by own team" do
        it "results in exception" do
          piece = {:team => :white, :piece_num => 7}
          lambda { @game.move(piece, [@x, @y]) }.should raise_error(RuntimeError)
        end
      end

      describe "occupied by opponent" do
        it "results in exception" do
          piece = {:team => :red, :piece_num => 4}
          lambda { @game.move(piece, [@x, @y]) }.should raise_error(RuntimeError)
        end
      end
    end
  end


  describe "move to valid square" do
    before(:each) do
      @game = Game.new
    end

    describe "by a red piece" do
      it "validate and move" do
        piece = {:team => :red, :piece_num => 4}
        position = @game.position(piece)
        x, y = position.first, position.last
        @game.move(piece, [x-1, y-1])
        position = @game.position(piece)
        x, y = position.first, position.last
        @game.move(piece, [x-1, y-1])
        @game.position(piece).should eq [6, 4]
      end
    end

    describe "by white piece" do
      it "validate and move" do
        piece = {:team => :white, :piece_num => 12}
        position = @game.position(piece)
        x, y = position.first, position.last
        @game.move(piece, [x-1, y+1])
        position = @game.position(piece)
        x, y = position.first, position.last
        @game.move(piece, [x-1, y+1])
        @game.position(piece).should eq [5, 5]
      end
    end
  end


  describe "play game" do
    before(:all) do
      @game = Game.new
    end

    it "allow or block appropriate moves" do
      piece = {:team => :red, :piece_num => 8}
      position = @game.position(piece)
      x, y = position.first, position.last
      lambda { @game.move(piece, [x, y]) }.should raise_error

      piece = {:team => :red, :piece_num => 4}
      position = @game.position(piece)
      x, y = position.first, position.last
      @game.move(piece, [x-1, y-1])
      position = @game.position(piece)
      x, y = position.first, position.last
      @game.move(piece, [x+1, y-1])
      @game.position(piece).should eq [8, 4]

      piece = {:team => :white, :piece_num => 12}
      position = @game.position(piece)
      x, y = position.first, position.last
      lambda { @game.move(piece, [x+1, y+1]) }.should raise_error

      piece = {:team => :red, :piece_num => 8}
      position = @game.position(piece)
      x, y = position.first, position.last
      @game.move(piece, [x+1, y-1])
      @game.position(piece).should eq [8, 6]

      piece = {:team => :white, :piece_num => 12}
      position = @game.position(piece)
      x, y = position.first, position.last
      @game.move(piece, [x-1, y+1])
      position = @game.position(piece)
      x, y = position.first, position.last
      @game.move(piece, [x-1, y+1])
      @game.position(piece).should eq [5, 5]

      piece = {:team => :red, :piece_num => 2}
      position = @game.position(piece)
      x, y = position.first, position.last
      lambda { @game.move(piece, [x+1, y-1]) }.should raise_error

      piece = {:team => :white, :piece_num => 8}
      position = @game.position(piece)
      x, y = position.first, position.last
      @game.move(piece, [x-1, y+1])
      position = @game.position(piece)
      x, y = position.first, position.last
      @game.move(piece, [x-1, y+1])
      position = @game.position(piece)
      x, y = position.first, position.last
      [x, y].should eq [6, 4]
      lambda { @game.move(piece, [x-1, y+1]) }.should raise_error

      #   keep playing
    end
  end

end