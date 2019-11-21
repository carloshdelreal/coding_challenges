# frozen_string_literal: true

# Permutation class
class Permutation
  def next_permutation(nums)
    jg = nil
    swap_index = nil
    swap_number = nil
    (nums.length - 2).downto(0) do |index|
      jg = just_greater(nums.slice((index + 1)..-1), nums[index])
      next if jg.nil?

      swap_index = index
      swap_number = index + jg[1] + 1
      break
    end
    return nums.reverse if jg.nil?

    nums[swap_index], nums[swap_number] = nums[swap_number], nums[swap_index]
    # puts "jg: #{jg} swap_index:#{swap_index}, swap_number:#{swap_number}"
    head = nums.slice(0..(swap_index - 1))
    tail = nums.slice((swap_index + 1)..-1).sort
    # puts "head: #{head}, tail: #{tail}"

    return [nums[swap_index]] + tail if swap_index.zero?

    head + [nums[swap_index]] + tail
  end

  def just_greater(arr, target)
    least = nil
    least_index = nil
    arr.each_with_index do |x, index|
      next unless x > target

      if least.nil? || x < least
        least = x
        least_index = index
      end
    end
    return nil if least.nil?

    [least, least_index]
  end
end
