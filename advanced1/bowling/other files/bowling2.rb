require 'pry'

# OVER THE LINE! YOU'RE ENTERING A WORLD OF PAIN!
class Game
  attr_reader :frames

  def initialize
    @frames = [[]]
  end

  def roll(pins)
    raise 'Should not be able to roll after game is over' if over?
    raise 'Pins must have a value from 0 to 10' unless (0..10).cover?(pins)

    # if current_frame.reduce(0, :+) + pins > 10 && frames.size < 10
    raise 'Pin count exceeds pins on the lane' if pins > pins_on_lane

    current_frame << pins

    return if frames.size == 10

    frames << [] if current_frame_done?
  end

  def pins_on_lane
    down_on_current_frame = current_frame.reduce(:+)

    YOU ARE HERE

    if current_frame_last?
    else
      10 - = current_frame[0]
    end

    return 10 - down_on_current_frame
  end

  def more_than_on_lane?(pins)
    return current_frame[0] + pins > 

    if current_frame_last? && current_frame[0] == 10 &&
       current_frame[1] != 10 &&
       current_frame.size == 2
      current_frame[1] + pins > 10
    else
      current_frame[0] + pins > 10
    end


  end

  def first_strike_not_second_strike
    
  end

  def current_frame_done?
    if current_frame_last?
      current_frame.size == 3 ||
        open?(current_frame) && current_frame.size == 2
    else
      current_frame.size == 2 || strike?(current_frame)
    end
  end

  def open?(frame)
    frame.reduce(0, :+) < 10
  end

  def score
    raise 'Score cannot be taken until the end of the game' unless over?

    result = 0
    frames.each_index do |index|
      result += frame_score(index)
    end
    result
  end

  def frame_score(index)
    frame = frames[index]
    result = frame.reduce(:+)
    return result if index == 9
    if strike?(frame)
      result += bonus_roll_sum(2, index)
    elsif spare?(frame)
      result += bonus_roll_sum(1, index)
    end
    result
  end

  def current_frame
    frames[-1]
  end

  def current_frame_last?
    frames.size == 10
  end

  def strike?(frame)
    frame == [10]
  end

  def spare?(frame)
    frame.size == 2 && frame.reduce(:+) == 10
  end

  def over?
    current_frame_last? && current_frame_done?
  end

  def bonus_roll_sum(num_rolls, index)
    next_frame = frames[index + 1]
    result = next_frame[0]

    if num_rolls == 2 && next_frame.size == 1
      result += frames[index + 2][0]
    elsif num_rolls == 2
      result += next_frame[1]
    end

    result
  end
end
