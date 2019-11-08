# frozen_string_literal: true

class SumOf3
  def greatest_negative(list, start, finish)
    guess = (start + finish) / 2
    return guess if finish - start == 1
    # puts "guess: #{guess}, start: #{start}, finish: #{finish}"
    return greatest_negative(list, guess, finish) if (list[guess]).negative?

    greatest_negative(list, start, guess)
  end

  def three_sum_2(nums)
    return [] if nums.length < 3

    numbers = nums.sort
    zero_index = greatest_negative(numbers, 0, numbers.length - 1)
    zero_index += 1 if numbers.index(0)

    # puts "#{numbers.join(' ')}, zero_index: #{zero_index}"
    solutions = []
    finish = nums.length - 1
    (0..zero_index).each do |i|
      finish.downto(zero_index + 1).each do |j|
        # puts "i: #{i} j:#{j}"

        ((i + 1)...j).each do |k|
          next if (numbers[i] + numbers[k]).positive?

          # puts "#{numbers[i]}, #{numbers[j]}, #{numbers[k]}"
          if (numbers[i] + numbers[j] + numbers[k]).zero?
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
          if (nums[i] + nums[j] + nums[k]).zero?
            triplet = [nums[i], nums[j], nums[k]].sort
            solutions << triplet unless solutions.include? triplet
          end
        end
      end
    end
    solutions
  end

  def three_sum_3(nums)
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
    (0..finish).each do |i|
      finish.downto(0).each do |j|
        next if indexes[nums[i] + nums[j]].nil?

        comb = indexes[nums[i] + nums[j]] - [i, j]
        comb.each do |x|
          next if i > x || x > j

          triplet = [nums[i], nums[j], nums[x]].sort
          solutions << triplet unless solutions.include? triplet
        end
      end
    end
    solutions
  end

  def greatest_negative_or_first_zero(arr)
    zero_index = greatest_negative(arr, 0, arr.length - 1)
    zero_index += 1 if arr.index(0)
    zero_index
  end

  def three_sum(nums)
    return [] if nums.length < 3

    # puts "Arr: #{nums.join(' ')}"
    nums.sort!
    zero_index = greatest_negative_or_first_zero(nums)
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
    (0..zero_index).each do |i|
      finish.downto(zero_index + 1).each do |j|
        # puts "i: #{i}, j: #{j}"
        next if indexes[nums[i] + nums[j]].nil?

        comb = indexes[nums[i] + nums[j]] - [i, j]
        comb.each do |x|
          next if i > x || x > j

          triplet = [nums[i], nums[j], nums[x]].sort
          solutions << triplet unless solutions.include? triplet
        end
      end
    end
    solutions
  end
end
