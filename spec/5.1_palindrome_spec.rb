# frozen_string_literal: true

require './leet/5.1_palindrome.rb'

RSpec.describe Palindrome do
  describe 'Palindrome Starts' do
    it 'aaabbb' do
      pal = Palindrome.new

      str = 'aaabbb'
      result = [[0, 1], [0, 2], [1, 2], [3, 4], [3, 5], [4, 5]]
      expect(pal.palindrome_starts(str)).to eql(result)
    end
    it 'aaabbbb' do
      pal = Palindrome.new

      str = 'aaabbbb'
      result = [[0, 1], [0, 2], [1, 2], [3, 4], [3, 5], [4, 5], [4, 6], [5, 6]]
      expect(pal.palindrome_starts(str)).to eql(result)
    end
    it 'babad' do
      pal = Palindrome.new

      str = 'babad'
      result = [[0, 2], [1, 3]]
      expect(pal.palindrome_starts(str)).to eql(result)
    end
    it 'ac' do
      pal = Palindrome.new

      str = 'ac'
      result = []
      expect(pal.palindrome_starts(str)).to eql(result)
    end
    it 'a' do
      pal = Palindrome.new

      str = 'a'
      result = []
      expect(pal.palindrome_starts(str)).to eql(result)
    end
  end

  describe 'Possible Palindrome' do
    it 'aaa' do
      pal = Palindrome.new

      seed = [0, 2]
      string = 'aaabbb'
      result = [0, 2]
      expect(pal.posible_palindrome(string, seed)).to eql(result)
    end
    it 'aaaa' do
      pal = Palindrome.new

      seed = [1, 2]
      string = 'aaaabbb'
      result = [0, 3]
      expect(pal.posible_palindrome(string, seed)).to eql(result)
    end
    it 'aabaa' do
      pal = Palindrome.new

      seed = [1, 3]
      string = 'aabaabbb'
      result = [0, 4]
      expect(pal.posible_palindrome(string, seed)).to eql(result)
    end
    it 'aa' do
      pal = Palindrome.new

      seed = [3, 4]
      string = 'aabaacbb'
      result = [3, 4]
      expect(pal.posible_palindrome(string, seed)).to eql(result)
    end
  end
  describe 'Longest palindrome' do
    it 'in aaabbb returns aaa' do
      pal = Palindrome.new

      string = 'aaabbb'
      result = 'aaa'
      expect(pal.longest_palindrome(string)).to eql(result)
    end
    it 'in aaabbbb returns bbbb' do
      pal = Palindrome.new

      string = 'aaabbbb'
      result = 'bbbb'
      expect(pal.longest_palindrome(string)).to eql(result)
    end
    it 'in babad returns bab' do
      pal = Palindrome.new

      string = 'babad'
      result = 'bab'
      expect(pal.longest_palindrome(string)).to eql(result)
    end
    it 'in aabcd returns aa' do
      pal = Palindrome.new

      string = 'aabcd'
      result = 'aa'
      expect(pal.longest_palindrome(string)).to eql(result)
    end
  end
  describe 'returns empty' do
    it 'in ac returns "a"' do
      pal = Palindrome.new

      string = 'ac'
      result = 'a'
      expect(pal.longest_palindrome(string)).to eql(result)
    end
    it 'in a returns a' do
      pal = Palindrome.new

      string = 'a'
      result = 'a'
      expect(pal.longest_palindrome(string)).to eql(result)
    end
  end
  describe 'last errors' do
    it 'in "cbbd" returns "bb"' do
      pal = Palindrome.new

      string = 'cbbd'
      result = 'bb'
      expect(pal.longest_palindrome(string)).to eql(result)
    end
    it 'in baacd returns aa' do
      pal = Palindrome.new

      string = 'baacd'
      result = 'aa'
      expect(pal.longest_palindrome(string)).to eql(result)
    end
  end
end
