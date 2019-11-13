
class StockBuySell
  def max_profit(prices)
    return 3
  end
  def max_profit(prices)
    greatest = 0
    smallest = nil
    max_profit = 0

    prices.each do |x|
      if smallest.nil? || x < smallest
        smallest = x
        greatest = x
      end

      next unless x > greatest

      greatest = x
      max_profit = greatest - smallest if (greatest - smallest) > max_profit
    end
    max_profit
  end
end