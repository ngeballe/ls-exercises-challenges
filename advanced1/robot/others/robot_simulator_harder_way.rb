# robot_simulator_harder_way.rb

# Input:
#   - robot's position
#   - robot's direction

# Robot
# - state: 
#   - { x, y }
#   - direction

# Command:
# - movements:
#   - turn right
#     - stay at same { x, y }
#     - north
#       - east
#     - east
#       - south
#     - south
#       - west
#     - west
#       - north
#   - turn left
#     - stay at same { x, y }
#     - north
#       - west
#     - west
#       - south
#     - south
#       - east
#     - east
#       - north
#   - advance
#     - north
#       - y += 1
#     - east
#       - x += 1
#     - south
#       - y -= 1
#     - west
#       - x -= 1

# Instructions
#   - R: turn right
#   - A: advance
#   - L: turn left
#   - how to execute:
#     - parse to letters
#     - look up the letter -> command
#     - robot takes commands

# Output:
#   - robot's position
#   - robot's direction

class Robot
  attr_reader :x, :y, :direction

  def initialize(x, y, direction)
    @x, @y, @direciton = x, y, direction
  end

  def turn_left
    case @direction
    when 'north' then @direciton = 'west'
    when 'west'  then @direciton = 'south'
    when 'south' then @direciton = 'east'
    else              @direciton = 'north'
    end
  end

  def turn_right
    case @direction
    when 'north' then @direciton = 'east'
    when 'east'  then @direciton = 'south'
    when 'south' then @direciton = 'west'
    else              @direciton = 'north'
    end
  end

  def advance
    case @direction
    when 'north' then @y += 1
    when 'east'  then @x += 1
    when 'south' then @y -= 1
    else              @x -= 1
    end
  end
end

class Instructions
  attr_reader :commands

  COMMANDS = { 'A' => :advance, 'L' => :turn_left, 'R' => :turn_right }

  def initialize(string)
    @commands = string.chars.map { |char| COMMANDS[char] }
  end
end

class Simulator
  attr_reader :robot

  def initialize
  end

  def place(robot, options)
    @robot = robot
  end

  def evaluate(robot, instructions)
    commands = Instructions.new(instructions).commands

    commands.each do |command|
      robot.send(command)
    end
  end
end

robot1 = Robot.new(0, 0, 'north')
robot1.
