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

def fits?(schedule, event)
  return false if schedule.empty?
  return schedule[-1][1] >= event[0]
end

def make_overlaps(array, schedule=[])
  array.each do |event|
    #puts event.to_s
    if fits?(schedule,event)
      if schedule[-1][1] < event[1]
        schedule[-1][1] = event[1]
      end
    else
      schedule << event
    end
  end
  return schedule[0] if schedule.length == 1
  schedule
end

def maximum_time_range(arrray)
  # write your code here
  agenda = arrray.each_slice(2).to_a
  #puts partition(agenda).to_s
  make_overlaps(partition(agenda))
  
end

p maximum_time_range([10, 18, 4, 6, 14, 16, 5, 8])
# => [[4, 8], [10, 18]]