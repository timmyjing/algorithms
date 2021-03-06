require 'byebug'

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1

    pivot = array.pop
    
    array.select {|a| a < pivot} + [pivot] + array.select{|a| a >= pivot }
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    
  end

  def self.partition(array, start, length, &prc)
  end
end

