def partition(array)
  p array.join(' ')
  return array if array.length == 1
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
  agendabefore + [pivot] + agendaafter

end

def time_scheduler(array)
  # write your code here
  agendabefore = []
  agendaafter = []
  pivot = array.slice(0,2)
  array.each_slice(2) do |event|
    if event[0] < pivot[0]
      agendabefore.append(event)
    else
      agendaafter.append(event)
    end 
  end
  partition(agendabefore) + [pivot] + partition(agendaafter)
  
end

p time_scheduler([4, 8, 1, 3, 7, 9, 5, 6])
# => [[1,3], [5,6], [7,9]]