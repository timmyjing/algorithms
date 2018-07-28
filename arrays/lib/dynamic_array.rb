require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0
    @capacity = 8
  end

  # O(1)
  def [](index)
    raise 'index out of bounds' unless check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    raise 'index out of bounds' unless index < capacity
    @store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if length == 0
    el = self[length - 1]
    self[length - 1] = nil
    @length -= 1
    el
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if length == capacity
    self[length] = val
    @length += 1
    self
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if length == 0
    el = self[0]
    1.upto(length - 1) do |i|
      self[i - 1] = self[i]
    end
    self[length - 1] = nil
    @length -= 1
    el
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if length == capacity
    length.downto(1) do |i|
      self[i] = self[i - 1]
    end
    @length += 1
    self[0] = val
    val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    index + 1 <= length 
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    old = store
    @capacity *= 2
    store = StaticArray.new(capacity)
    length.times do |i|
      store[i] = old[i]
    end
  end
end
