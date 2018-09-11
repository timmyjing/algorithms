# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.
require 'byebug'
require_relative 'ring_buffer'
# require_relative 'dynamic_array'
# FIFO
class QueueWithMax
  attr_accessor :store, :max_store

  def initialize
    @store = RingBuffer.new
    @max_store = []
  end

  def enqueue(val)
    if length == 0
      max_store.push(val)
    else
      if val <= max_store.last
        max_store.push(val)
      else
        until max_store.empty? || max_store.last > val
          max_store.pop
        end
        max_store.push(val)
      end
    end
    store.push(val)
  end

  def dequeue
    val = store.shift
    max_store.shift if max_store.first == val
  end

  def max
    return nil if length == 0
    max_store.first
  end

  def length
    store.length
  end

end


# enqueue [1,2,3,4,5,3]
# max should be [5,5,5,5,5,3]
# set max at every step? if value equal to max gets dequeued, then refind max? or should keep an array
# of the max at every step and if a new max is enqueued, then change all the previous els in max array
# to the new max, else add new element in (because when max el ahead is dequeued, max will be the current el)

# enq [10,9,8,7,6,5,10]
# [10,10]
# max [5,5,10,10,10]
# max should be [10,10,10,2,1]