class Clock
  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def +(minutes)
    hours, minutes = minutes.divmod(60)
    @hour = (@hour + hours) % 24
    @minute += minutes
    self
  end

  def -(minutes)
    self + -minutes
  end

  def ==(other)
    @hour == other.hour && @minute == other.minute
  end

  def to_s
    format('%02d:%02d', @hour, @minute)
  end

  def self.at(hour, minute = 0)
    new(hour, minute)
  end

  protected

  attr_reader :hour, :minute
end
