require_relative "heap"

class Array
  def heap_sort!
    BinaryMinHeap.heapify_down(self, 0)
  end
end

# each step, build a min heap with array and you have the min element as the first
