class OCR
  attr_reader :rows_of_digits

  def initialize(text)
    @rows_of_digits = text.split("\n\n")
  end

  def convert
    rows_converted = rows_of_digits.map do |row_of_digits|
      RowOfDigits.new(row_of_digits).convert
    end
    rows_converted.join(',')
  end
end

class RowOfDigits
  attr_reader :text, :text_lines

  OCR_CONVERSIONS = {
    [' _', '| |', '|_|'] => '0',
    ['', '  |', '  |']   => '1',
    [' _', ' _|', '|_']  => '2',
    [' _', ' _|', ' _|'] => '3',
    ['', '|_|', '  |']   => '4',
    [' _', '|_', ' _|']  => '5',
    [' _', '|_', '|_|']  => '6',
    [' _', '  |', '  |'] => '7',
    [' _', '|_|', '|_|'] => '8',
    [' _', '|_|', ' _|'] => '9'
  }.freeze

  def initialize(text)
    @text_lines = text.split("\n")
  end

  def convert
    converted_chars = []
    each_text_chunk do |chunk|
      converted_chars << OCR_CONVERSIONS.fetch(chunk) { '?' }
    end
    converted_chars.join
  end

  def each_text_chunk
    counter = 0
    while counter < text_width
      text_lines.map
      chunk = text_lines.map do |line|
        line_of_chunk = line[counter..counter + 2]
        line_of_chunk.nil? ? '' : line_of_chunk.rstrip
      end
      yield chunk
      counter += 3
    end
  end

  def text_width
    text_lines.map(&:size).max
  end
end
