require 'pry'

# The game consists of 10 frames:
#   - open frame: pins of the two throws
#   - spare frame: pins + bonus (next throw)
#   - strike frame: pins + bonus (next 2 throws)

# [[10], [3, 4], [9, 1], [3, 4]...]

# XX*
# X**
# 4/*
# 23

class Game # :nodoc:
  attr_reader :frames, :current_frame

  def initialize
    @frames = []
    @current_frame = []
  end

  def roll(pins)
    validate_roll!(pins)

    @current_frame << pins

    if tenth_frame_done?
      @frames << @current_frame
    elsif regular_frame_done?
      @frames << @current_frame
      @current_frame = []
    end
  end

  def regular_frame_done?
    frames.size < 9 &&
      (@current_frame == [10] || @current_frame.reduce(:+) == 10 ||
      @current_frame.size == 2)
  end

  def tenth_frame_done?
    frames.size == 9 &&
      (@current_frame.size == 2 && @current_frame.reduce(:+) < 10) ||
      @current_frame.size == 3
  end

  def score
    validate_score_timing!

    total = 0
    10.times do
      current_frame = @frames.shift
      total += current_frame.reduce(:+)
      bonus = score_bonus(current_frame)
      total += bonus if bonus
    end
    total
  end

  def score_bonus(current_frame)
    if current_frame == [10]
      @frames.flatten.take(2).reduce(:+)
    elsif current_frame.reduce(:+) == 10
      @frames.flatten.first
    end
  end

  def validate_roll!(pins)
    # require 'pry'; binding.pry if pins == 6
    raise 'Should not be able to roll after game is over' if @frames.size == 10
    raise 'Pins must have a value from 0 to 10' if pins < 0 || pins > 10

    if fewer_than_10_pins_up? && (pins + @current_frame[-1] > 10)
      raise 'Pin count exceeds pins on the lane'
    end
    # if @frames.size < 9 && @current_frame.size == 1 &&
    #    @current_frame[0] < 10 && pins + @current_frame[0] > 10
    #   raise 'Pin count exceeds pins on the lane'
    # elsif @current_frame.size >= 1 && @current_frame[-1] < 10 &&
    #       pins + @current_frame[-1] > 10
    #   raise 'Pin count exceeds pins on the lane'
    #   # XX*
    #   # X**
    #   # 4/*
    #   # 23
    # end
  end

  def fewer_than_10_pins_up?
    if @frames.size < 9
      @current_frame.size == 1 && @current_frame[0] < 10
    else
      @current_frame.size >= 1 && @current_frame[-1] < 10
    end
  end

  def validate_score_timing!
    raise 'Score cannot be taken until the end of the game' if @frames.size < 10

    if @current_frame.size < 2 || (@current_frame.size == 2 &&
      @current_frame.reduce(:+) >= 10)
      raise 'Game is not yet over, cannot score!'
    end
  end
end
