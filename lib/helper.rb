module Helper

  #class for parsing the input
  class Parser
    def initialize
      @start = false
      @command = ""
      @arguments = []
    end

    def parse(input)
      inputArray = input.split
      @command = inputArray[0]

      #checking the validity of inputs
      if valid_input?(inputArray) && @start
        return [@command, @arguments]
      end
      return false
    end

    private

    def valid_input?(inputArray)
      should_robot_quit?
      if inputArray[1]
        @arguments = inputArray[1].split(",")
      else
        @arguments = []
      end
      validate_arguments!
    end

    def validate_arguments!
      #Commands are to be ignored until a valid PLACE command is issued
      if (@command == "PLACE" && @arguments.length == 3 && Conversions.convert_direction_into_angle(@arguments[2]) != false)
        @start = true
        return true
      elsif (@command != "PLACE" && @arguments.empty?)
        return true
      else
        return false
      end
    end

    #To quit the game
    def should_robot_quit?
      if @command == "QUIT"
        exit! #TO end the game
      end
    end
  end

  # class for the conversions
  class Conversions
    def self.convert_direction_into_angle(direction)
      case direction
      when "N" then 0
      when "S" then 180
      when "E" then 90
      when "W" then 270
      else false
      end
    end

    def self.convert_angle_into_direction(angle)
      case angle
      when 0 then "N"
      when 180 then "S"
      when 90 then "E"
      when 270 then "W"
      else false
      end
    end
  end
end
