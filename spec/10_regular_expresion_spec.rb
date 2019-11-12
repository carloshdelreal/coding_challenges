# frozen_string_literal: true

require './leet/10_regular_expresion.rb'

RSpec.describe Regex do
  describe 'Regex' do
    it 'is_match("aa", "a") # false' do
      rex = Regex.new

      string = 'aa'
      regular_ex = 'a'
      result = false
      expect(rex.is_match(string, regular_ex)).to eql(result)
    end
    it 'is_match("a", "a*") # true' do
      rex = Regex.new

      string = 'a'
      regular_ex = 'a*'
      result = true
      expect(rex.is_match(string, regular_ex)).to eql(result)
    end
    it 'is_match("ab", ".*") # true' do
      rex = Regex.new

      string = 'ab'
      regular_ex = '.*'
      result = true
      expect(rex.is_match(string, regular_ex)).to eql(result)
    end
    it 'is_match("aab", "c*a*b") #true' do
      rex = Regex.new

      string = 'aab'
      regular_ex = 'c*a*b'
      result = true
      expect(rex.is_match(string, regular_ex)).to eql(result)
    end
    it 'is_match("missisippi", "mis*is*p*.") #false' do
      rex = Regex.new

      string = 'missisippi'
      regular_ex = 'mis*is*p*.'
      result = false
      expect(rex.is_match(string, regular_ex)).to eql(result)
    end
    it 'is_match("aaa", "a*a") # true' do
      rex = Regex.new

      string = 'aaa'
      regular_ex = 'a*a'
      result = true
      expect(rex.is_match(string, regular_ex)).to eql(result)
    end
    it 'is_match("aaa", "ab*a*c*a") # true' do
      rex = Regex.new

      string = 'aaa'
      regular_ex = 'ab*a*c*a'
      result = true
      expect(rex.is_match(string, regular_ex)).to eql(result)
    end
    it 'is_match("ab", ".*c") # false' do
      rex = Regex.new

      string = 'ab'
      regular_ex = '.*c'
      result = false
      expect(rex.is_match(string, regular_ex)).to eql(result)
    end
    it 'is_match("a", "ab*") # true' do
      rex = Regex.new

      string = 'a'
      regular_ex = 'ab*'
      result = true
      expect(rex.is_match(string, regular_ex)).to eql(result)
    end
    it 'is_match("aaa", "aaaa") # false' do
      rex = Regex.new

      string = 'aaa'
      regular_ex = 'aaaa'
      result = false
      expect(rex.is_match(string, regular_ex)).to eql(result)
    end
    it 'is_match("mississippi", "mis*is*ip*.") # false' do
      rex = Regex.new

      string = 'mississippi'
      regular_ex = 'mis*is*ip*.'
      result = true
      expect(rex.is_match(string, regular_ex)).to eql(result)
    end
    it 'is_match("a", "ab*a") # false' do
      rex = Regex.new

      string = 'a'
      regular_ex = 'ab*a'
      result = false
      expect(rex.is_match(string, regular_ex)).to eql(result)
    end
  end
  describe 'expressions' do
    it 'from "aaa" gets ["a", "a", "a"]' do
      rex = Regex.new

      string = 'aaa'
      result = %w[a a a]
      expect(rex.expressions(string)).to eql(result)
    end
    it 'from "aaa*" gets ["a", "a", "a"]' do
      rex = Regex.new

      string = 'aaa*'
      result = %w[a a a*]
      expect(rex.expressions(string)).to eql(result)
    end
    it 'from "aa*c" gets ["a", "a*", "c"]' do
      rex = Regex.new

      string = 'aa*c'
      result = %w[a a* c]
      expect(rex.expressions(string)).to eql(result)
    end
    it 'from "a*cbd*e.*" gets ["a*", "c", "b", "d*", "e", ".*"]' do
      rex = Regex.new

      string = 'a*cbd*e.*'
      result = %w[a* c b d* e .*]
      expect(rex.expressions(string)).to eql(result)
    end
  end
end
