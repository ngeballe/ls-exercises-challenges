# - chars: letter, space, point
  # - any invalid inputs? (other chars => exceptions)
# - words: 1-20 letters
  # - more than 20 letters? do you have to deal w/ this?
# input:
  # - 1 - * words
  # - separated by 1 - * spaces
  # - terminated: 0 - * spaces, followed by a point
# output:
  # - words: have the odd words reversed
  # - separated by 1 space
  # - terminated: 0 spaces, followed by a point

# input
  # - '
  # - '   .'

reverse_odd_words('') # => ''
reverse_odd_words('.') # => '.'
reverse_odd_words('hello.') # => 'hello.'
reverse_odd_words('hello word.') # => 'hello drow.'
reverse_odd_words('hello word .') # => 'hello drow.'
reverse_odd_words('hello  word .') # => 'hello drow.'
reverse_odd_words('hello word  .') # => 'hello drow.'
reverse_odd_words('hello word world.') # => 'hello drow world.'
