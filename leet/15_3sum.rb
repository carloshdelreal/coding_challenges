# frozen_string_literal: true

class SumOf3
  # Leet example 1
  def three_sum_leet_1(nums)
    nums = nums.sort
    output = []
    nums.each_index do |i|
      break if nums[i].positive?

      next if i.positive? && (nums[i] == nums[i - 1])

      left = i + 1
      right = nums.size - 1
      while left < right
        sum = nums[i] + nums[left] + nums[right]
        if sum.positive?
          right -= 1
        elsif sum.negative?
          left += 1
        else
          output << [nums[i], nums[left], nums[right]]
          right -= 1
          left += 1
          right -= 1 while nums[right] == nums[right + 1]
          left += 1 while nums[left] == nums[left - 1]
        end
      end
    end
    output
  end

  # leet example 2
  def three_sum_leet_2(nums)
    return [] if nums.length < 3

    nums.sort!
    i = 0
    set = []
    while i < nums.length - 2 && nums[i] <= 0
      target = -nums[i]
      pairs = two_sum(nums[i + 1..-1], target)
      set += pairs.map { |pair| [-target] + pair }
      i += 1 while nums[i] == nums[i + 1]
      i += 1
    end
    set
  end

  def two_sum(nums, target)
    pairs = []
    i = 0
    j = nums.length - 1
    while i < j
      sum = nums[i] + nums[j]
      if sum < target
        i += 1
      elsif sum > target
        j -= 1
      else
        pairs << [nums[i], nums[j]]
        i += 1 while nums[i] == nums[i + 1]
        i += 1
        j -= 1 while nums[j] == nums[j - 1]
        j -= 1
      end
    end
    pairs
  end

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

  def load_indexes(nums)
    indexes = {}
    nums.each_with_index do |x, index|
      if indexes[-x].nil?
        indexes[-x] = [index]
      else
        indexes[-x].push(index)
      end
    end
    indexes
  end

  def three_sum_4(nums)
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
        indexes[-x].push(index)
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

  def three_sum_5(nums)
    return [] if nums.length < 3

    # puts "Arr: #{nums.join(' ')}"
    nums.sort!
    zero_index = greatest_negative_or_first_zero(nums)
    solutions = []
    indexes = load_indexes(nums)
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
          break
        end
      end
    end
    solutions
  end

  def three_sum_6(nums)
    return [] if nums.length < 3

    # puts "Arr: #{nums.join(' ')}"
    nums.sort!
    zero_index = greatest_negative_or_first_zero(nums)
    solutions = []
    indexes = load_indexes(nums)
    finish = nums.length - 1
    (0..zero_index).each do |i|
      finish.downto(zero_index + 1).each do |j|
        # puts "i: #{i}, j: #{j}"
        next if indexes[nums[i] + nums[j]].nil?

        comb = indexes[nums[i] + nums[j]] - [i, j]
        comb.each do |x|
          next if i > x || x > j

          triplet = [nums[i], nums[j], nums[x]].sort
          solutions << triplet
          break
        end
      end
    end
    solutions.uniq
  end
end
