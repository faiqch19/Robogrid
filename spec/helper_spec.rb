require "minitest/autorun"
require_relative "../lib/helper"

module Helper
  describe Parser do
    before do
      @parser = Helper::Parser.new
    end

    describe "#parse" do
      it "should return false if the input is not valid" do
        _(@parser.parse("Invalid Input")).must_equal false
      end

      it "should return false if the input has invalid number of arguments (MOVE, LEFT, RIGHT, REPORT)" do
        _(@parser.parse("MOVE 0,0,E")).must_equal false
        _(@parser.parse("LEFT 0,0,N")).must_equal false
        _(@parser.parse("RIGHT INVALID")).must_equal false
        _(@parser.parse("REPORT PRINT")).must_equal false
      end

      it "should return false if the input has invalid number of arguments (PLACE)" do
        _(@parser.parse("PLACE")).must_equal false
      end

      it "should return false if the input has invalid arguments (PLACE)" do
        _(@parser.parse("PLACE 0,0,K")).must_equal false
      end

      it "should return false until a valid PLACE command is issued" do
        _(@parser.parse("MOVE")).must_equal false
      end

      it "should return parsed array if a valid PLACE command is issued" do
        valid_parser = Helper::Parser.new
        _(valid_parser.parse("PLACE 0,0,N")).must_equal ["PLACE", ["0", "0", "N"]]
      end

      it "should return parsed array if after a valid PLACE command is issued" do
        valid_parser = Helper::Parser.new
        valid_parser.parse("PLACE 0,0,N")
        _(valid_parser.parse("MOVE")).must_equal ["MOVE", []]
        _(valid_parser.parse("LEFT")).must_equal ["LEFT", []]
        _(valid_parser.parse("RIGHT")).must_equal ["RIGHT", []]
        _(valid_parser.parse("REPORT")).must_equal ["REPORT", []]
      end
    end
  end

  describe Conversions do
    describe "#convert_direction_into_angle" do
      it "should convert valid directions into angles" do
        _(Helper::Conversions.convert_direction_into_angle("N")).must_equal 0
        _(Helper::Conversions.convert_direction_into_angle("E")).must_equal 90
        _(Helper::Conversions.convert_direction_into_angle("S")).must_equal 180
        _(Helper::Conversions.convert_direction_into_angle("W")).must_equal 270
      end

      it "should return false if the directions are not valid" do
        _(Helper::Conversions.convert_direction_into_angle("SW")).must_equal false
      end
    end

    describe "#convert_angle_into_direction" do
      it "should convert valid angles into directions" do
        _(Helper::Conversions.convert_angle_into_direction(0)).must_equal "N"
        _(Helper::Conversions.convert_angle_into_direction(90)).must_equal "E"
        _(Helper::Conversions.convert_angle_into_direction(180)).must_equal "S"
        _(Helper::Conversions.convert_angle_into_direction(270)).must_equal "W"
      end

      it "should return false if the angles are not valid" do
        _(Helper::Conversions.convert_angle_into_direction(500)).must_equal false
      end
    end
  end
end
