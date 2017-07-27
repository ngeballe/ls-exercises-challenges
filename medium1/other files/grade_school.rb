class School
  def initialize
    @students_by_grade = {}
  end

  def to_h
    @students_by_grade
  end

  def add(student, grade)
    if @students_by_grade.include?(grade)
      @students_by_grade[grade] << student
    else
      @students_by_grade[grade] = [student]
    end
    sort_data
  end

  def grade(num)
    students = @students_by_grade[num]
    students.nil? ? [] : students
  end

  private

  def sort_data
    # @students_by_grade = @students_by_grade.sort.to_h
    # sorted = {}
    # @students_by_grade.each do |grade, students|
    #   sorted[grade] = students.sort
    # end
    # @students_by_grade = sorted

    sorted_within_grade = @students_by_grade.map do |grade, students|
      [grade, students.sort]
    end
    @students_by_grade = sorted_within_grade.sort.to_h
  end
end
