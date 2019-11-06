def three_sum(nums)
  solutions = []
  start = 0
  finish = nums.length - 1
  (0..finish-2).each do |i|
      ((i+1)..(finish-1)).each do |j|
          ((j+1)..finish).each do |k|
              if (nums[i] + nums[j] + nums[k]) == 0
                  triplet = [nums[i], nums[j], nums[k]].sort
                  solutions << triplet unless solutions.include? triplet
              end
          end
      end
  end
  solutions
  
end