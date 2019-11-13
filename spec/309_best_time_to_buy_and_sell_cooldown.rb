# frozen_string_literal: true

require './leet/309_best_time_to_buy_and_sell_cooldown'

RSpec.describe StockBuySell do
  describe 'max_profit' do
    it '[1,2,3,0,2] outpus 3' do
      stock = StockBuySell.new

      arr = [1, 2, 3, 0, 2]
      result = 3
      expect(stock.max_profit(arr)).to eql(result)
    end
  end
end

