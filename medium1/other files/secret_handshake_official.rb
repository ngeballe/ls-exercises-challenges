input:
- take a decimal number
- take a string binary

validation:
- invalid binary => 0

logic:
- convert it to the appropriate sequence of events for a secret handshake

1 = wink
10 = double blink
100 = close your eyes
1000 = jump

10000 = reverse order of operations in the handshake


model the problem / solution:

- convert the decmial to a binary string
  - e.g., "0111" => reverse => '1110' => ['wink', 'double blink', 'close your eyes']
  - if the first digit is 1, reverse

data structure
['wink', 'double blink', 'close your eyes', 'jump']


# me
# - create an event_lookup hash with the rules -- power of 2 => event ( 0 => wink, etc., 3 => jump )
# - create an event lookup array -- [wink, double blink, close eyes, jump]
# - create an array of events
# - look at the string characters, in reverse order, with the index:
# - if the char is 1 at that index, add the event for the index to the events array

