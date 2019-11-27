# frozen_string_literal: true

require 'benchmark'
require './leet/15_3sum'

arr = [13, 5, -4, -9, 1, -3, 10, -7, 7, 3, 1, -13, -11, 7, -10, 12, -15, 13, 5, -8, -11, -12, -15, -13, -3, -13, 5, -4,
       6, 1, -10, 4, 13, -7, 3, -9, -3, -2, -1, 12, 9, -15, 14, 5, 0, -10, -5, -8, -12, -15, -1, -8, 11, -9, -14, -7,
       -6, 7, -4, -15, -15, -7, -4, 14, 1, 6, 12, 14, 12, -11, 11, -2, 11, 2, -12, -4, 7, -2, -5, 10, -9, 10, 9, -13,
       -14, 11, -13, -13, 3, -1, 9, 3, 7, -9, -6, -14, 4, -8, 7, 1, -12, -5, 14, 14, 12, 10, -12, -3, -7, -2, -8, -9,
       -7, 9, -7, -13, 5, -12, -11, -7, 2, 14, 3, -14]

n = 10

Benchmark.bm do |benchmark|
  benchmark.report('V 1.0') do
    sum = SumOf3.new
    n.times do
      sum.three_sum_1(arr)
    end
  end
  benchmark.report('V 2.0') do
    sum = SumOf3.new
    n.times do
      sum.three_sum_2(arr)
    end
  end
  benchmark.report('V 3.0') do
    sum = SumOf3.new
    n.times do
      sum.three_sum_3(arr)
    end
  end
  benchmark.report('V 4.0') do
    sum = SumOf3.new
    n.times do
      sum.three_sum_4(arr)
    end
  end
  benchmark.report('V 5.0') do
    sum = SumOf3.new
    n.times do
      sum.three_sum_5(arr)
    end
  end
  benchmark.report('V 6.0') do
    sum = SumOf3.new
    n.times do
      sum.three_sum_6(arr)
    end
  end
  benchmark.report('leet 1') do
    sum = SumOf3.new
    n.times do
      sum.three_sum_leet_1(arr)
    end
  end
  benchmark.report('leet 2') do
    sum = SumOf3.new
    n.times do
      sum.three_sum_leet_2(arr)
    end
  end

  # puts "#{(y.real / x.real) * 100}%"
  # puts "#{(x.real / y.real) * 100}%"
end
