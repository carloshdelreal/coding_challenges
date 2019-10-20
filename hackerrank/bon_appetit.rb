# frozen_string_literal: true

def bon_appetit(bill, k, b)
  ana_pay = (bill.sum - bill[k]) / 2
  if ana_pay == b
    puts 'Bon Appetit'
  else
    puts b - ana_pay
  end
end

k = 1
bill = [3, 10, 2, 9]
b = 12

p bon_appetit(bill, k, b)
