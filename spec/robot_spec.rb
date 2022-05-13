require "minitest/autorun"
require_relative "../lib/robot"

module Robogrid
  describe Robot do
    before do
      @robot = Robogrid::Robot.new
    end

    describe "#initialize" do
      it "should itialized with the position 0x0 and direction N by default " do
        _(@robot.report).must_equal "Output: 0, 0, N"
      end
    end

    describe "#place" do
      it "should place the robot anywhere in the grid if the position is valid" do
        @robot.place(0, 0, 0)
        _(@robot.report).must_equal "Output: 0, 0, N"
      end

      it "should not place the robot anywhere in the grid if the position is not valid" do
        @robot.place(20, 30, 0)
        _(@robot.report).wont_match "Output: 20, 30, N"
      end
    end

    describe "#move" do
      it "should not move the robot in the given direction" do
        @robot.place(0, 0, 0)
        @robot.move
        @robot.move
        _(@robot.report).must_equal "Output: 0, 2, N"
      end

      it "should not move the robot if it is out of grid" do
        @robot.place(0, 0, 0)
        @robot.left
        _(@robot.report).must_equal "Output: 0, 0, W"
        @robot.move
        _(@robot.report).wont_match "Output: 1, 0, W"
      end
    end

    describe "#left" do
      it "should change the direction to West if the robot is in North direction" do
        @robot.place(0, 0, 0)
        @robot.left
        _(@robot.report).must_equal "Output: 0, 0, W"
      end
    end

    describe "#right" do
      it "should change the direction to East if the robot is in North direction" do
        @robot.place(0, 0, 0)
        @robot.right
        _(@robot.report).must_equal "Output: 0, 0, E"
      end
    end

    describe "#report" do
      it "should report the output of robot (position and direction)" do
        @robot.place(0, 0, 0)
        _(@robot.report).must_equal "Output: 0, 0, N"
      end
    end
  end
end
