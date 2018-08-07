require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(8)
    @start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    store[(index + start_idx) % capacity]
  end

  # O(1)
  def []=(index, val)
    # check_index(index)
    raise 'out of index' if index >= capacity
    store[(index + start_idx) % capacity] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if length == 0
    # idx = (start_idx + length - 1) % capacity
    idx = length - 1
    el = self[idx]
    self[idx] = nil
    @length -= 1
    el
  end

  # O(1) ammortized
  def push(val)
    resize! if capacity == length
    # idx = (start_idx + length) % capacity
    idx = length
    self[idx] = val
    @length += 1
    val
  end

  # O(1)
  def shift
    raise "index out of bounds" if length == 0
    el = self[0]
    self[0] = nil
    @start_idx = (@start_idx + 1) % capacity
    @length -= 1
    el
  end

  # O(1) ammortized
  def unshift(val)
    resize! if length == capacity
    self[-1] = val
    @length += 1
    @start_idx = (@start_idx - 1) % capacity
    val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index >= length
  end

  def resize!
    old_store = store
    @capacity *= 2
    @store = StaticArray.new(capacity)
    length.times do |i|
      idx = (start_idx + i) % (capacity / 2)
      @store[i] = old_store[idx]
    end
    @start_idx = 0
  end
end
