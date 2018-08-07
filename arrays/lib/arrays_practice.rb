#Single Element in a Sorted Array
#Given a sorted array consisting of only integers where every element appears twice except for one element which appears once. 
#Find this single element that appears only once. Do it in O(logn) time and O(1) space!

#Things you should be thinking of
#O(logn) should immediately make you think of Binary Search.
#What condition are we checking for?
#How do we know which direction to go next?

def find_single(arr)
  high = arr.length - 1
  low = 0
  while low < high
    mid = high - low / 2
    return arr[mid] if arr[mid] != arr[mid + 1] && arr[mid] != arr[mid - 1]
    if arr[mid] == arr[mid -1]
      if (mid - 1 + low).even?
        low = mid + 1
      else
        high = mid - 2
      end
    end

    if arr[mid] == arr[mid + 1]
      if (mid + low).even?
        low = mid + 2
      else
        high = mid - 1
      end
    end
    
  end
  arr[low]
end


def wfs(str)
end