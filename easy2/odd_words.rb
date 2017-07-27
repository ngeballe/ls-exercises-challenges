def odd_words(string)
  return '' if string.empty?
  result = ''
  odd_word = false
  current_word = ''
  loop_through_string(string, odd_word, current_word, result)
  result.strip << '.'
end

def loop_through_string(string, odd_word, current_word, result)
  string.each_char do |char|
    if char != ' ' && char != '.'
      odd_word ? current_word.prepend(char) : current_word << char
    else
      odd_word = !odd_word
      result << current_word
      result << ' ' unless result.end_with?(' ')
      current_word = ''
    end
  end
end

p odd_words('') == ''
p odd_words('.') == '.'
p odd_words('whats the matter with kansas.') ==
  'whats eht matter htiw kansas.'
p odd_words('kite.') == 'kite.'
p odd_words('drink water.') == 'drink retaw.'
