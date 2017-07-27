def time_to_run
  start_time = Time.now
  yield
  end_time = Time.now
  puts "That took #{end_time - start_time} seconds"
end

def average_time_to_run(num_times = 5)
  time_recordings = []
  num_times.times do
    start_time = Time.now
    yield
    time_to_run = Time.now - start_time
    time_recordings << time_to_run
  end
  average_time = time_recordings.reduce(:+) / num_times
  puts "Average time: #{average_time}"
end

def primes_below(ending_number)
  result = []
  (2..ending_number).each do |num|
    result << num if prime?(num)
  end
  result
end

def prime?(number)
  return false if number.even?
  divisor = 3
  while divisor < Math.sqrt(number)
    # next if divisor.even?
    return false if number % divisor == 0
    # divisor.odd? ? divisor += 2 : divisor += 1
    divisor += 2
  end
  true
end

# time_to_run { primes_below(10**5) }

average_time_to_run { primes_below(10**4) }
