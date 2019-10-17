# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}

def find_median_sorted_arrays(nums1, nums2)
  total_length = nums1.length + nums2.length
  median_index = total_length/2
  previous = nil
  if total_length.odd?
      loop do
        
          if nums1[0] != nil && (nums2[0] == nil || nums1[0] < nums2[0])
              return nums1.shift.to_f if median_index == 0
              nums1.shift
          else
              return nums2.shift.to_f if median_index == 0
              nums2.shift
          end
          median_index -=1
      end
  else
      loop do
         # puts "previous: #{previous}, nums1: #{nums1}, nums2: #{nums2}"
          if nums1[0] != nil && (nums2[0] == nil || nums1[0] < nums2[0])
              return nums1[0].to_f if nums2[0].nil? && previous.nil? && median_index == 0
              return (previous + nums1[0]) / 2.0 if median_index == 0
              previous = nums1.shift
          else
              return nums2[0].to_f if nums1[0].nil? && previous.nil? && median_index == 0
              return (previous + nums2[0]) / 2.0 if median_index == 0
              previous = nums2.shift
          end
          median_index -= 1
      end
  end    
end

p find_median_sorted_arrays([1,2],[3,4])
p find_median_sorted_arrays([2],[])
p find_median_sorted_arrays([],[2])
p find_median_sorted_arrays([2,3],[])
p find_median_sorted_arrays([],[2,3])