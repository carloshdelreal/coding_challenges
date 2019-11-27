# frozen_string_literal: true

require 'benchmark'
require './leet/10_regular_expresion'

string = 'sdfklsmlxcnvklasdnmasdlfanmsdfaslkfjaiouqwen'
regex = 's*d*f*k*l*x*c*v*k*d*n*a*d*l*f*.*'

n = 10

Benchmark.bm do |benchmark|
  benchmark.report('V 1.0') do
    sum = RegexRecursive.new
    n.times do
      sum.is_match1(string, regex)
    end
  end
  benchmark.report('V 2.0') do
    sum = RegexRecursive.new
    n.times do
      sum.is_match2(string, regex)
    end
  end
  benchmark.report('V 3.0') do
    sum = RegexRecursive.new
    n.times do
      sum.is_match(string, regex)
    end
  end
  # puts "#{(y.real / x.real) * 100}%"
  # puts "#{(x.real / y.real) * 100}%"
end
