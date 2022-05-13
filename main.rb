require_relative "lib/robot.rb"

puts "\n\nWelcome to Robo Grid"

puts "\nPLEASE REFER TO THE LIST OF COMMANDS TO USE \n"
puts "\nPLACE, MOVE, LEFT, RIGHT, REPORT \n\n"

puts "\nNOTE: ALL THE OTHER COMMANDS WILL BE IGNORED, TO EXIT THE GAME USE QUIT \n\n"

parser = Helper::Parser.new
robot = Robogrid::Robot.new

puts "\n\nEnter commands: "
while true
  parsedArray = parser.parse(gets.chomp)

  if parsedArray
    command = parsedArray[0]
    case command
    when "PLACE"
      x, y = parsedArray[1][0].to_i, parsedArray[1][1].to_i
      direction = Helper::Conversions.convert_direction_into_angle(parsedArray[1][2])
      robot.place(x, y, direction)
    when "MOVE" then robot.move
    when "LEFT" then robot.left
    when "RIGHT" then robot.right
    when "REPORT" then puts robot.report
    end
  end
end
