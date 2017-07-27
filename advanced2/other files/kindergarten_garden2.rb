# require 'pry'

# class Garden
#   PLANTS = { 'V' => :violets, 'R' => :radishes, 'C' => :clover,
#              'G' => :grass }.freeze
#   STUDENTS = %w(Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry).freeze

#   attr_reader :diagram, :students

#   def initialize(diagram, students = STUDENTS)
#     @diagram = diagram.split("\n").map(&:chars)
#     @students = students.sort

#     students.sort.each do |student|
#       define_singleton_method student.downcase do
#         plant_letter_coordinates = owner_array.map do |row|
#           row.each_with_index.select do |owner_name, idx|
#             owner_name == student.downcase
#           end.map(&:last)
#         end
#         plant_letters = @diagram.each_index.map do |index|
#           coordinates_for_row = plant_letter_coordinates[index]
#           row[coordinates_for_row.first..coordinates_for_row.last]
#         end
#         plant_letters.flatten.map { |letter| PLANTS[letter] }
#       end
#     end
#   end

#   def owner_array
#     row = students.map { |student| [student.downcase] * 2 }.flatten
#     [row] * 2
#   end
# end
