
class Weighcalc
  def solve(weight_0, weight_1, weight_2)
    # Write your code here
    # To debug: $stderr.puts "Debug messages...";
    if weight_0 == "" || weight_1 == "" || weight_2 == ""
        return 0
    end

    if weight_0 > weight_1
        if weight_0 > weight_2
            return 0
        else
            return 2
        end
    else
        if weight_1 > weight_2
        return 1    
        return 2
        end
    end
    
  end
end