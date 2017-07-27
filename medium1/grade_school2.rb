class School
  attr_reader :roster

  def initialize
    @roster = {}
  end

  def to_h
    result = roster.sort.to_h
    result.each_value(&:sort!)
    result
  end

  def add(student, grade)
    if roster[grade]
      roster[grade] << student
    else
      roster[grade] = [student]
    end
  end

  def grade(number)
    roster[number] || []
  end
end
