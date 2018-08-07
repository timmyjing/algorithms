require_relative './p02_hashing'

class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) {Array.new}
    @num_buckets = num_buckets
    @count = 0
  end

  def insert(key)
    resize! if count == num_buckets
    self[key.hash].push(key)
    @count += 1
    key
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    if include? key
      self[key.hash].delete(key)
      @count -= 1
    end
    key
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    store[num % num_buckets]
  end

  def num_buckets
    @num_buckets
  end

  def resize!
    old = store.flatten
    @num_buckets *= 2
    @count = 0
    @store = Array.new(num_buckets) {Array.new}
    old.each do |key|
      insert(key)
    end
  end
end
