# frozen_string_literal: true

class SumOf3
  def greatestNegative(list, start, finish)
    guess = (start + finish) / 2
    return guess if finish - start == 1
    # puts "guess: #{guess}, start: #{start}, finish: #{finish}"
    if list[guess] < 0
      return greatestNegative(list, guess, finish)
    else
      return greatestNegative(list, start, guess)
    end
  end

  def three_sum_2(nums)
    return [] if nums.length < 3

    numbers = nums.sort
    zero_index = greatestNegative(numbers, 0, numbers.length - 1)
    zero_index += 1 if numbers.index(0)

    # puts "#{numbers.join(' ')}, zero_index: #{zero_index}"
    solutions = []
    finish = nums.length - 1
    (0..zero_index).each do |i|
      finish.downto(zero_index + 1).each do |j|
        # puts "i: #{i} j:#{j}"

        ((i + 1)...j).each do |k|
          next if (numbers[i] + numbers[k]) > 0

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

  def three_sum_1(nums)
    solutions = []
    finish = nums.length - 1
    (0..finish - 2).each do |i|
      ((i + 1)..(finish - 1)).each do |j|
        ((j + 1)..finish).each do |k|
          if (nums[i] + nums[j] + nums[k]) == 0
            triplet = [nums[i], nums[j], nums[k]].sort
            solutions << triplet unless solutions.include? triplet
          end
        end
      end
    end
    solutions
  end

  def tree_sum(nums)
    solutions = []
    indexes = {}
    nums.each_with_index do |x, index|
      if indexes[-x].nil?
        indexes[-x] = [index]
      else
        indexes[-x].append(index)
      end
    end
    finish = nums.length - 1
    (0..finish).each do |_i|
      finish.downto(0).each do |j|
      end
    end
  end
end
