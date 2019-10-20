# frozen_string_literal: true

# Complete the staircase function below.
def staircase(n)
  n = n
  (1..n).each do |i|
    s = ''
    (n - 1).downto(0) do |j|
      s += i <= j ? ' ' : '#'
    end
    puts s
  end
end

staircase(3)
