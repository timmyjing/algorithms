# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'
# FIFO
class QueueWithMax
  attr_accessor :store

  def initialize
  end

  def enqueue(val)
  end

  # def enqueue_max(val)
  #   while @max[0] && @max[@max.length - 1] < val
  #     @max.pop
  #   end
  # @max.push(val)
  # end

  def dequeue
  end

  def max
  end

  def length
  end

end
