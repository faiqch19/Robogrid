require "minitest/autorun"
require_relative "../lib/grid"

module Robogrid
  describe Grid do
    describe "#initialize" do
      it "should initialize default grid of 6x6 " do
        grid = Robogrid::Grid.new
        _(grid.width).must_equal 6
        _(grid.height).must_equal 6
      end
    end

    describe "#initialize with params" do
      it "should initialize grid with the given params" do
        gridWithParams = Robogrid::Grid.new({ width: 10, height: 12 })
        _(gridWithParams.width).must_equal 10
        _(gridWithParams.height).must_equal 12
      end
    end
  end
end
