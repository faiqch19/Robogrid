require_relative "helper.rb"
require_relative "grid.rb"

module Robogrid
  class Robot
    def initialize
      @grid = Robogrid::Grid.new
      @x_axis, @y_axis, @direction = 0, 0, 0
    end

    def place(x, y, direction)
      if valid_position?(x, y, direction)
        @x_axis = x
        @y_axis = y
        @direction = direction
      end
    end

    def move
      case @direction
      when 0 then place(@x_axis, @y_axis + 1, @direction)   #move into North Direction
      when 90 then place(@x_axis + 1, @y_axis, @direction)  #move into East Direction
      when 180 then place(@x_axis, @y_axis - 1, @direction) #move into South Direction
      when 270 then place(@x_axis - 1, @y_axis, @direction) #move into West Direction
      end
    end

    def right
      place(@x_axis, @y_axis, ((@direction + 90) % 360))
    end

    def left
      place(@x_axis, @y_axis, ((@direction - 90) % 360))
    end

    def report
      "Output: #{@x_axis}, #{@y_axis}, #{Helper::Conversions.convert_angle_into_direction(@direction)}"
    end

    #In case if any method is missing on call
    def method_missing(method, *args, &block)
      puts "#{self.class.to_s} doesn't know how to perform :#{method}"
    end

    private

    def valid_position?(x, y, direction)
      (direction != false) &&
      (direction >= 0 && direction <= 270) &&
      (x >= 0 && x <= @grid.width) &&
      (y >= 0 && y <= @grid.height)
    end
  end
end
