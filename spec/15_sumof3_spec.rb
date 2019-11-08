# frozen_string_literal: true

require './leet/15_3sum'

RSpec.describe SumOf3 do
  describe 'Sum of 3' do
    it 'tree zeroes' do
      sum = SumOf3.new

      arr = [0, 0, 0]
      result = [[0, 0, 0]]
      expect(sum.three_sum(arr)).to eql(result.sort)
    end
    it 'just tree' do
      sum = SumOf3.new

      arr = [1, 1, -2]
      result = [1, 1, -2]
      expect(sum.three_sum(arr)).to eql([result.sort])
    end
    it 'empty' do
      sum = SumOf3.new

      arr = []
      result = []
      expect(sum.three_sum(arr)).to eql(result.sort)
    end
    it 'no zeros' do
      sum = SumOf3.new

      arr = [-5, 1, -3, -1, -4, -2, 4, -1, -1]
      result = [[-5, 1, 4], [-3, -1, 4]]
      expect(sum.three_sum(arr)).to eql(result.sort)
    end
    it 'the longer one' do
      sum = SumOf3.new

      arr = [-4, -2, 1, -5, -4, -4, 4, -2, 0, 4, 0, -2, 3, 1, -5, 0]
      result = [[-5, 1, 4], [-4, 0, 4], [-4, 1, 3], [-2, -2, 4], [-2, 1, 1], [0, 0, 0]]
      expect(sum.three_sum(arr).sort).to eql(result.sort)
    end
  end
  describe 'greates negative' do
    it 'returns the greatest negative index' do
      sum = SumOf3.new

      arr = [-100, -20, -10, -5, -4, -2, -1, 0, 0, 1, 1, 2, 3, 4, 4, 4]
      expect(sum.greatest_negative(arr, 0, arr.length - 1)).to eql(6)

      arr = [-1, 0, 1, 2, 3]
      expect(sum.greatest_negative(arr, 0, arr.length - 1)).to eql(0)
    end
  end
end
