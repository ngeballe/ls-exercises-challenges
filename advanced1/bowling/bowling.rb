# individual frame
class Frame
  attr_reader :roll_nums
  attr_accessor :total, :pins_on_lane

  def initialize
    @pins_on_lane = 10
    @pins_hit = []
    @strike = false
    @spare = false
    @total = 0
    @roll_nums = []
    @done = false
  end

  def <<(pins)
    @pins_hit << pins
    self.total += pins
    if pins == 10
      @strike = true
    elsif @pins_hit.reduce(:+) == 10
      @spare = true
    end
    @pins_on_lane -= pins
  end

  def strike?
    @strike
  end

  def spare?
    @spare
  end

  def strike_or_spare?
    strike? || spare?
  end

  def size
    @pins_hit.size
  end

  def done!
    @done = true
  end

  def done?
    @done
  end
end

# whole game
class Game
  attr_reader :rolls, :roll_num, :frames

  def initialize
    @frames = [Frame.new]
    @roll_num = 0
    @rolls = []
  end

  def roll(pins)
    current_frame = @frames[-1]

    validate_roll(pins, current_frame)

    current_frame << pins
    @rolls << pins
    current_frame.roll_nums << @roll_num
    @roll_num += 1

    reload_pins_conditionally
    current_frame.done! if current_frame_done?
    add_new_frame_conditionally

    # if @frames.size == 10
    #   if current_frame.strike? || current_frame.spare?
    #     current_frame.reload_pins_on_lane
    #     current_frame.done! if current_frame.size == 3
    #   elsif current_frame.size == 2
    #     current_frame.done!
    #   end
    # elsif @frames.size < 10 && (pins == 10 || second_roll_in_frame?)
    #   current_frame.done!
    #   @frames << Frame.new
    # end
  end

  def current_frame
    @frames[-1]
  end

  def validate_roll(pins, frame)
    raise 'Should not be able to roll after game is over' if over?
    raise 'Pins must have a value from 0 to 10' unless (0..10).cover?(pins)
    raise 'Pin count exceeds pins on the lane' if pins > frame.pins_on_lane
  end

  def reload_pins_conditionally
    return unless current_frame.pins_on_lane.zero? &&
                  @frames.size == 10 && current_frame.strike_or_spare?
    current_frame.pins_on_lane = 10
  end

  def add_new_frame_conditionally
    return unless @frames.size < 10 && current_frame.done?
    @frames << Frame.new
  end

  def current_frame_done?
    if @frames.size < 10
      current_frame.size == 2 || current_frame.strike?
    else
      current_frame.size == (current_frame.strike_or_spare? ? 3 : 2)
    end
  end

  def second_roll_in_frame?
    @frames.last.size == 2
  end

  def adjust_totals_for_strikes_and_spares
    @frames.each_with_index do |frame, index|
      next if index == 9
      if frame.strike?
        frame.total += next_n_rolls(frame, 2).reduce(:+)
      elsif frame.spare?
        frame.total += next_n_rolls(frame, 1).reduce(:+)
      end
    end
  end

  def score
    raise 'Score cannot be taken until the end of the game' unless over?
    adjust_totals_for_strikes_and_spares
    @frames.map(&:total).reduce(:+)
  end

  def next_n_rolls(frame, n)
    next_roll = frame.roll_nums.max + 1
    last_roll_to_include = frame.roll_nums.max + n
    rolls[next_roll..last_roll_to_include]
  end

  def over?
    @frames.size == 10 && @frames[9].done?
  end
end
