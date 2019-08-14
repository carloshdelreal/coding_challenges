require 'set'

def load_primes
	for i in 2...10000
		$primes.add i if is_prime? i
	end
end

def is_prime?(n)
	divisor = 2
	while divisor < n
		if n % divisor == 0
			return false
		end	
		divisor += 1
	end
	return true
end

$primes = Set.new
load_primes


def factor_numbers x
	factors = []
	$primes.each do |prime|
		if prime > x
			break
		else
			factors << prime if x % prime == 0
		end
	end
	factors
end

def prime_prime(array)
	# write your code here
	factors_count = {}
	max_count = 0
	max_count_factor = nil
	array.each do |x|
		factors = factor_numbers x
		factors.each do |factor|
			if factors_count.has_key?(factor)
				factors_count[factor] += 1
				if factors_count[factor] > max_count
					max_count = factors_count[factor]
					max_count_factor = factor
				end

			else
				factors_count[factor] = 1
			end
		end 
	end
	max_count_factor
end

  
puts prime_prime([2, 3, 5, 6, 9])
# => 3

puts prime_prime([121, 17, 21, 29, 11, 341, 407, 19, 119, 352])
# => 11

puts prime_prime([7, 6, 7, 3, 77, 14, 28, 35, 42])
# => 7