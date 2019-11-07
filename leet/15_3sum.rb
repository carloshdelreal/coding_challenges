def greatestNegative(list, start, finish)
  guess = (start + finish) / 2
  return guess if finish-start == 1
  # puts "guess: #{guess}, start: #{start}, finish: #{finish}"
  if list[guess] < 0
    return greatestNegative(list, guess, finish)
  else
    return greatestNegative(list, start, guess)
  end
end

def three_sum(nums)
  return [] if nums.length < 3
  numbers = nums.sort()
  zero_index = greatestNegative(numbers, 0, numbers.length-1)
  if numbers.index(0)
    zero_index += 1
  end
  

  # puts "#{numbers.join(' ')}, zero_index: #{zero_index}"
  solutions = []
  finish = nums.length - 1
  (0..zero_index).each do |i|
    ((finish).downto(zero_index+1)).each do |j|
      # puts "i: #{i} j:#{j}"
      ((i+1)...j).each do |k|
        # puts "#{numbers[i]}, #{numbers[j]}, #{numbers[k]}"
        if (numbers[i] + numbers[j] + numbers[k]) == 0
            triplet = [numbers[i], numbers[j], numbers[k]].sort
            solutions << triplet unless solutions.include? triplet
        end
      end
    end
  end
  solutions
end

p three_sum([-1,0,1,2,-1,-4])
p three_sum([])
p three_sum([0,0,0])
p three_sum([1,1,-2]) # [[1,1,-2]]
p three_sum([-4,-2,1,-5,-4,-4,4,-2,0,4,0,-2,3,1,-5,0]) #[[-5,1,4],[-4,0,4],[-4,1,3],[-2,-2,4],[-2,1,1],[0,0,0]]
p three_sum([-5,1,-3,-1,-4,-2,4,-1,-1]) # [[-5,1,4],[-3,-1,4]]


# l = [-100,-20,-10,-5,-4,-2,-1,0, 0,1,1,2,3,4,4,4]
# l2 = [-1,0,1,2,3]
# p greatestNegative(l, 0,l.length-1)
# p greatestNegative(l2, 0,l2.length-1)