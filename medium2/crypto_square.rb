class Crypto
  def initialize(text)
    @text = text
    @plaintext = normalize_plaintext
  end

  def normalize_plaintext
    @text.downcase.gsub(/[^0-9a-z]/, '')
  end

  def size
    Math.sqrt(@plaintext.size).ceil
  end

  def plaintext_segments
    @plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext
    ciphertext_array.flatten.join
  end

  def normalize_ciphertext
    ciphertext_array.map(&:join).join(' ')
  end

  private

  def ciphertext_array
    results = []
    size.times do |column_num|
      results << plaintext_segments.map { |line| line[column_num] }.compact
    end
    results
  end
end
