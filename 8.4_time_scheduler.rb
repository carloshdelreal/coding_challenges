def partition(array)
  #p array.join(' ')
  return array if array.length <= 1
  agendabefore = []
  agendaafter = []
  pivot = array.delete_at(0)
  array.each do |event|
    if event[0] < pivot[0]
      agendabefore.append(event)
    else
      agendaafter.append(event)
    end
  end
  partition(agendabefore) + [pivot] + partition(agendaafter)

end

def clean_overlaps(array)
  array.each_with_index do | item, index |
    next if index == 0
    puts item.join(' ')

  end

end

def time_scheduler(array)
  # write your code here
  agenda = array.each_slice(2).to_a 
  clean_overlaps(partition(agenda))
  
end

p time_scheduler([4, 8, 1, 3, 7, 9, 5, 6])
# => [[1,3], [5,6], [7,9]]