class Meetup
  require 'date'

  DAYS_IN_MONTH = { 1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30,
                    7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30,
                    12 => 31 }.freeze

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    # calculate day
    # get days in the month
    days_in_month = DAYS_IN_MONTH[@month]
    days_in_month = 29 if Date.leap?(@year) && @month == 2
    (1..days_in_month).each do |day|
      # it should be a number for which the weekday
      # that it falls that month fits the schedule
      date = Date.new(@year, @month, day)
      next unless date.strftime('%A') == weekday.to_s.capitalize
      return date if fits?(date, schedule, days_in_month)
    end
  end

  private

  def fits?(date, schedule, days_in_month)
    # return false unless date.strftime('%A') == weekday.to_s.capitalize
    day = date.day
    if schedule == :last
      day + 7 > days_in_month
    else
      schedule_to_day_range = { first: 0..7, second: 8..14, third: 15..21,
                                fourth: 22..28, teenth: 13..19 }
      schedule_to_day_range[schedule].cover?(day)
    end
  end
end
