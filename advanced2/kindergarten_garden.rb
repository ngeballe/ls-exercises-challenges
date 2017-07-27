class Garden
  PLANTS = { 'V' => :violets, 'R' => :radishes, 'C' => :clover,
             'G' => :grass }.freeze
  STUDENTS = %w(Alice Bob Charlie David Eve Fred Ginny Harriet
                Ileana Joseph Kincaid Larry).freeze

  attr_reader :diagram

  def initialize(diagram, students = STUDENTS)
    @diagram = diagram.split("\n").map(&:chars)

    students.sort.each_with_index do |student, index|
      define_singleton_method student.downcase do
        plants_in_section(index * 2)
      end
    end
  end

  def plants_in_section(first_column_index)
    letters = diagram.map do |row|
      row.slice(first_column_index, 2)
    end
    letters.flatten.map { |letter| PLANTS[letter] }
  end
end
