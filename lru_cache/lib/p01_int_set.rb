class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise 'Out of bounds' unless is_valid?(num)
    raise 'already inserted' if @store[num]
    @store[num] = true
  end

  def remove(num)
    raise 'Out of bounds' unless is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num <= @max && num >= 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) {Array.new}
    @num_buckets = num_buckets
  end

  def insert(num)
    self[num].push(num) unless include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @num_buckets
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @count = 0
    @store = Array.new(num_buckets) {Array.new}
  end

  def insert(num)
    resize! if count == num_buckets
    self[num].push(num)
    @count += 1
    num
  end

  def remove(num)
    if include?(num)
      @count -= 1
      self[num].delete(num)
      num
    else
      nil
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @num_buckets
  end

  def resize!
    old = @store.flatten
    @num_buckets *= 2
    @store = Array.new(num_buckets) {Array.new}
    @count = 0
    old.each do |el|
      insert(el)
    end
  end
end
