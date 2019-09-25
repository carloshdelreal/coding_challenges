# frozen_string_literal: true

def index_match(array, start = 0, finish = array.length)
  guess = (finish + start) / 2
  return guess if array[guess] == guess
  return -1 if start == finish || start == guess

  array[guess] > guess ? index_match(array, start, guess) :
                       index_match(array, guess, finish)
end

puts index_match([0, 2, 3, 7, 9, 11])
# => 0
