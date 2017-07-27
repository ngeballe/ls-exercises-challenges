class Prime
  def self.nth(n)
    raise ArgumentError, 'must be a positive integer' if n < 1

    primes = [2]
    potential_prime = 3
    while primes.size < n
      primes << potential_prime if prime?(potential_prime, primes)
      potential_prime += 2
    end
    primes.last
  end

  def self.prime?(potential_prime, primes)
    primes.each do |prime|
      return false if (potential_prime % prime).zero?
      return true if prime**2 > potential_prime
    end
  end
end
