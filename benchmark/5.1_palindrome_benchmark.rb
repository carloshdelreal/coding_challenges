# frozen_string_literal: true

require 'benchmark'
require './leet/5.1_palindrome'

string = "abababababababababababababababababababababababababababababababab
          ababababababababababababababababababababababababababababababababa
          babababababababababababababababababababababababababababababababab
          ababababababababababababababababababababababababababababababababa
          bababababababababababababababababababababababababababababababababa
          bababababababababababababababababababababababababababababababababa
          babababababababababababababababababababababababababababababababab
          abababababababababababababababababababababababababababababababab
          abababababababababababababababababababababababababababababababab
          ababababababababababababababababababababababababababababababababab
          ababababababababababababababababababababababababababababababababa
          babababababababababababababababababababababababababababababababab
          ababababababababababababababababababababababababababababababababa
          babababababababababababababababababababababababababababababababab
          ababababababababababababababababababababababababababababababababa
          babababababababababababa"

n = 10

Benchmark.bm do |benchmark|
  benchmark.report('V 1.0') do
    pal = Palindrome.new
    n.times do
      pal.longest_palindrome_1(string)
    end
  end
  benchmark.report('V 2.0') do
    pal = Palindrome.new
    n.times do
      pal.longest_palindrome_2(string)
    end
  end
  benchmark.report('Mean') do
    pal = Palindrome.new
    n.times do
      pal.longest_palindrome_3(string)
    end
  end
end
