class Robot
  BEARINGS = [:north, :east, :south, :west].freeze

  attr_reader :bearing

  def orient(direction)
    raise ArgumentError unless BEARINGS.include?(direction)
    @bearing = direction
  end

  def turn_right
    @bearing = case @bearing
               when :west  then :north
               when :north then :east
               when :east  then :south
               when :south then :west
               end
  end

  def turn_left
    @bearing = case @bearing
               when :west  then :south
               when :south then :east
               when :east  then :north
               when :north then :west
               end
  end

  def at(x, y)
    @x = x
    @y = y
  end

  def coordinates
    [@x, @y]
  end

  def advance
    case @bearing
    when :north
      @y += 1
    when :east
      @x += 1
    when :south
      @y -= 1
    when :west
      @x -= 1
    end
  end
end

class Simulator
  LETTER_TO_COMMAND = { 'R' => :turn_right, 'L' => :turn_left, 'A' => :advance }

  def instructions(string)
    string.chars.map do |char|
      LETTER_TO_COMMAND[char]
    end
  end

  def place(robot, options)
    robot.at(options[:x], options[:y])
    robot.orient(options[:direction])
  end

  def evaluate(robot, instruction_string)
    instructions(instruction_string).each do |instruction|
      robot.send(instruction)
    end
  end
end
