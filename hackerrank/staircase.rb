# Complete the staircase function below.
def staircase(n)
  n = n
  (1..n).each do |i|
    s = ''
    (n-1).downto(0) do |j|
      i <= j ? s += ' ' : s += '#'
    end
    puts s    
  end
end

staircase(3)