require "rspec"

describe "Game" do

  describe "game start" do
    it "has 24 pieces" do
      #assert_equal 24, Piece.all.size
      true.should == false
    end

    ["red", "white"].each do |team_name|
      it "has 12 pieces on #{team_name} team" do
        #team = teams(team_name)
        #pieces = Piece.find_all_by_team_id(team.id)
        #assert_equal 12, pieces.size
        true.should == false
      end
    end

    it "has all 24 pieces in the correct start positions" do
      #pieces = Piece.all

      [[1,1],[3,1],[5,1],[7,1],[2,2],[4,2],[6,2],[8,2],[1,3],[3,3],[5,3],[7,3]].each do |coordinates|
        #assert pieces.any? { |p| p.team_id == teams(:white).id  &&  p.x == coordinates[0]  &&  p.y == coordinates[1] }
        true.should == false
      end

      [[2,6],[4,6],[6,6],[8,6],[1,7],[3,7],[5,7],[7,7],[2,8],[4,8],[6,8],[8,8]].each do |coordinates|
        #assert pieces.any? { |p| p.team_id == teams(:red).id  &&  p.x == coordinates[0]  &&  p.y == coordinates[1] }
        true.should == false
      end
    end
  end


  describe "" do
    before(:each) do
      #@piece = pieces(:white_12)
    end

    describe "moving to invalid square" do
      it "should not get far and should not move piece" do
        #x = @piece.x
        #y = @piece.y
        #assert_raise(ArgumentError) { @piece.move(@piece.x, 3.5) }
        #@piece.reload
        #assert_equal x, @piece.x
        #assert_equal y, @piece.y
        #
        #assert_raise(ArgumentError) { @piece.move(3.5, @piece.y) }
        #assert_raise(ArgumentError) { @piece.move(3.5, 3.5) }
        #assert_raise(ArgumentError) { @piece.move(@piece.x, -1) }
        #assert_raise(ArgumentError) { @piece.move(-1, @piece.y) }
        #assert_raise(ArgumentError) { @piece.move(0, 1) }
        #assert_raise(ArgumentError) { @piece.move("does_not_matter", 1) }
        #assert_raise(ArgumentError) { @piece.move(@piece.x, 9) }
        #assert_raise(ArgumentError) { @piece.move(@piece.x, 0) }
        #assert_raise(ArgumentError) { @piece.move(9, @piece.y) }
        #assert_raise(ArgumentError) { @piece.move(0, @piece.y) }
        #assert_raise(ArgumentError) { @piece.move(9, 9) }
        true.should == false
      end
    end

  #  describe "moving to light colored square" do
  #    it "should not validate and should not move piece" do
  #      x = @piece.x
  #      y = @piece.y
  #      assert_raise(ActiveRecord::RecordInvalid) { @piece.move(4, 4) }
  #      @piece.reload
  #      assert_equal x, @piece.x
  #      assert_equal y, @piece.y
  #
  #      assert_equal 1, @piece.errors.size
  #      assert_equal "base", @piece.errors.first[0]
  #      assert_equal "must only move immediate forward and diagonal", @piece.errors.first[1]
  #    end
  #  end
  #
  #  describe "moving to horizontally adjacent (side way) square" do
  #    it "should not validate" do
  #      assert_raise(ActiveRecord::RecordInvalid) { @piece.move(8, 3) }
  #      assert_equal 1, @piece.errors.size
  #    end
  #  end
  #
  #  context "moving to vertically adjacent (up or down) square" do
  #    should "not validate" do
  #      assert_raise(ActiveRecord::RecordInvalid) { @piece.move(7, 4) }
  #      assert_equal 1, @piece.errors.size
  #      assert_equal "base", @piece.errors.first[0]
  #      assert_equal "must only move immediate forward and diagonal", @piece.errors.first[1]
  #    end
  #  end
  #
  #  context "moving backward" do
  #    context "by a red piece" do
  #      should "not validate" do
  #        piece = pieces(:red_4)
  #        assert_nothing_raised(ActiveRecord::RecordInvalid) { piece.move(7, 5) }
  #        assert_raise(ActiveRecord::RecordInvalid) { piece.move(8, 6) }
  #        assert_equal 1, piece.errors.size
  #        assert_equal "base", piece.errors.first[0]
  #        assert_equal "must only move immediate forward and diagonal", piece.errors.first[1]
  #      end
  #    end
  #
  #    context "by a white piece" do
  #      should "not validate" do
  #        assert_nothing_raised(ActiveRecord::RecordInvalid) { @piece.move(8, 4) }
  #        assert_raise(ActiveRecord::RecordInvalid) { @piece.move(7, 3) }
  #        assert_equal 1, @piece.errors.size
  #        assert_equal "base", @piece.errors.first[0]
  #        assert_equal "must only move immediate forward and diagonal", @piece.errors.first[1]
  #      end
  #    end
  #  end
  #
  #  context "moving forward by more than 1 diagonal" do
  #    should "not validate" do
  #      assert_raise(ActiveRecord::RecordInvalid) { @piece.move(5, 5) }
  #      assert_equal 1, @piece.errors.size
  #      assert_equal "base", @piece.errors.first[0]
  #      assert_equal "must only move immediate forward and diagonal", @piece.errors.first[1]
  #    end
  #  end
  #
  #  context "moving to square" do
  #    context "occupied by own team" do
  #      should "not validate" do
  #        white_7 = pieces(:white_7)
  #        assert_raise(ActiveRecord::RecordInvalid) { white_7.move(@piece.x, @piece.y) }
  #        assert_equal 1, white_7.errors.size
  #        assert_equal "base", white_7.errors.first[0]
  #        assert_equal "must not move to an occupied square", white_7.errors.first[1]
  #      end
  #    end
  #
  #    context "occupied by opponent" do
  #      should "not validate" do
  #        red_4 = pieces(:red_4)
  #        assert_nothing_raised(ActiveRecord::RecordInvalid) { @piece.move(6, 4) }
  #        assert_nothing_raised(ActiveRecord::RecordInvalid) { @piece.move(7, 5) }
  #        assert_raise(ActiveRecord::RecordInvalid) { @piece.move(red_4.x, red_4.y) }
  #        assert_equal 1, @piece.errors.size
  #        assert_equal "base", @piece.errors.first[0]
  #        assert_equal "must not move to an occupied square", @piece.errors.first[1]
  #      end
  #    end
  #  end
  #end
  #
  #
  #context "moving to valid square" do
  #  context "by a red piece" do
  #    should "validate and move" do
  #      piece = pieces(:red_4)
  #      y = piece.y
  #      assert_nothing_raised(ActiveRecord::RecordInvalid) { piece.move(7, 5) }
  #      assert_nothing_raised(ActiveRecord::RecordInvalid) { piece.move(6, 4) }
  #      piece.reload
  #      assert_equal 6, piece.x
  #      assert_equal 4, piece.y
  #      assert_not_equal y, piece.y
  #    end
  #  end
  #
  #  context "by white piece" do
  #    should "validate and move" do
  #      piece = pieces(:white_12)
  #      y = piece.y
  #      assert_nothing_raised(ActiveRecord::RecordInvalid) { piece.move(6, 4) }
  #      assert_nothing_raised(ActiveRecord::RecordInvalid) { piece.move(5, 5) }
  #      piece.reload
  #      assert_equal 5, piece.x
  #      assert_equal 5, piece.y
  #      assert_not_equal y, piece.y
  #    end
  #  end
  #end
  #
  #
  #context "play sequence" do
  #  should "allow or block appropriate moves" do
  #    piece = pieces(:red_8)
  #    x = piece.x
  #    y = piece.y
  #    assert_raise(ActiveRecord::RecordInvalid) { piece.move(8, 6) }
  #    piece.reload
  #    assert_equal x, piece.x
  #    assert_equal y, piece.y
  #
  #    piece = pieces(:red_4).reload
  #    y = piece.y
  #    assert_nothing_raised(ActiveRecord::RecordInvalid) { piece.move(7, 5) }
  #    assert_nothing_raised(ActiveRecord::RecordInvalid) { piece.move(8, 4) }
  #    moved_piece = piece.reload
  #    assert_equal 8, moved_piece.x
  #    assert_equal 4, moved_piece.y
  #    assert_not_equal y, moved_piece.y
  #    assert_raise(ActiveRecord::RecordInvalid) {piece.move(7, 5)}
  #
  #    assert_raise(ActiveRecord::RecordInvalid) { pieces(:white_12).reload.move(8, 4) }
  #
  #    piece = pieces(:red_8).reload
  #    y = piece.y
  #    assert_nothing_raised(ActiveRecord::RecordInvalid) { piece.move(8, 6) }
  #    moved_piece = piece.reload
  #    assert_equal 8, moved_piece.x
  #    assert_equal 6, moved_piece.y
  #    assert_not_equal y, moved_piece.y
  #
  #    piece = pieces(:white_12).reload
  #    y = piece.y
  #    assert_nothing_raised(ActiveRecord::RecordInvalid) { piece.move(6, 4) }
  #    assert_nothing_raised(ActiveRecord::RecordInvalid) { piece.move(5, 5) }
  #    piece.reload
  #    assert_equal 5, piece.x
  #    assert_equal 5, piece.y
  #    assert_not_equal y, piece.y
  #
  #    piece = pieces(:red_2).reload
  #    assert_raise(ActiveRecord::RecordInvalid, Exception) { piece.move(5, 5)}
  #
  #    piece = pieces(:white_8).reload
  #    y = piece.y
  #    assert_nothing_raised(ActiveRecord::RecordInvalid) { piece.move(7, 3)}
  #    assert_nothing_raised(ActiveRecord::RecordInvalid) { piece.move(6, 4)}
  #    piece.reload
  #    assert_equal 6, piece.x
  #    assert_equal 4, piece.y
  #    assert_not_equal y, piece.y
  #    x = piece.x
  #    y = piece.y
  #    assert_raise(ActiveRecord::RecordInvalid) { piece.move(5,5) }
  #    piece.reload
  #    assert_equal x, piece.x
  #    assert_equal y, piece.y
  #
  #    #   keep playing
  #  end
  end

end