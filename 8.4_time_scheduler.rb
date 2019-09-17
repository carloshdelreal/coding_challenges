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

def fits(schedule, event)
  return true if schedule.empty?
  return schedule[-1][1] <= event[0]
end

def clean_overlaps(array, schedule=[])
  return schedule if array.empty?
  event = array.shift()
  if fits(schedule,event) 
    schedule << event
  else
    if fits(schedule.slice(0,schedule.length-1),event)
      poped = schedule.pop
      poped[1] < event[1] ? schedule << poped : schedule << event
    end
  end
  clean_overlaps(array,schedule)

end

def time_scheduler(array)
  # write your code here
  agenda = array.each_slice(2).to_a 
  clean_overlaps(partition(agenda))
  
end

p time_scheduler([4, 8, 1, 3, 7, 9, 5, 6])
# => [[1,3], [5,6], [7,9]]