# frozen_string_literal: true

require './leet/31_next_permutation'

RSpec.describe Permutation do
  describe 'Permutation' do
    it '[1,2,3] permutates to [1,3,2]' do
      per = Permutation.new

      arr = [1, 2, 3]
      result = [1, 3, 2]
      expect(per.next_permutation(arr)).to eql(result)
    end
    it '[3,2,1] permutates to [1,2,3]' do
      per = Permutation.new

      arr = [3, 2, 1]
      result = [1, 2, 3]
      expect(per.next_permutation(arr)).to eql(result)
    end
    it '[1,1,5] permutates to [1,5,1]' do
      per = Permutation.new

      arr = [1, 1, 5]
      result = [1, 5, 1]
      expect(per.next_permutation(arr)).to eql(result)
    end
    it '[1,3,2] permutates to [2,1,3]' do
      per = Permutation.new

      arr = [1, 3, 2]
      result = [2, 1, 3]
      expect(per.next_permutation(arr)).to eql(result)
    end
    it '[2,3,1] permutates to [3,1,2]' do
      per = Permutation.new

      arr = [2, 3, 1]
      result = [3, 1, 2]
      expect(per.next_permutation(arr)).to eql(result)
    end
    it '[1,3,2] permutates to [2,1,3]' do
      per = Permutation.new

      arr = [1, 3, 2]
      result = [2, 1, 3]
      expect(per.next_permutation(arr)).to eql(result)
    end
  end
  describe 'just greater with index' do
    it 'takes 3 form [1,2,3,4,5]' do
      great = Permutation.new

      arr = [1, 2, 3, 4, 5]
      target = 2
      result = [3, 2]
      expect(great.just_greater(arr, target)).to eql(result)
    end
    it 'takes 2 form [1,2]' do
      great = Permutation.new

      arr = [1, 2]
      target = 1
      result = [2, 1]
      expect(great.just_greater(arr, target)).to eql(result)
    end
    it 'takes nil form []' do
      great = Permutation.new

      arr = []
      target = 1
      result = nil
      expect(great.just_greater(arr, target)).to eql(result)
    end
    it 'returns nil form [1] looking for 1' do
      great = Permutation.new

      arr = [1]
      target = 1
      result = nil
      expect(great.just_greater(arr, target)).to eql(result)
    end
  end
end
