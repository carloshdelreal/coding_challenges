require 'set'



def number_of_primes(arr)
	# write your code here
	count = 0
	arr.each do |x|
		count += 1 if $primes.any? x
	end
	count
end

def load_primes
	for i in 0...10000
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
$primes.add 1
load_primes

puts number_of_primes([2, 3, 5, 6, 9])
# => 3

puts number_of_primes([121, 17, 21, 29, 11, 341, 407, 19, 119, 352])
# => 4

