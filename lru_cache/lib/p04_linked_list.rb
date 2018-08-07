class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @prev = nil
    @next = nil
  end

  def to_s
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    prev.next = @next unless prev.nil?
    @next.prev = prev
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = nil
  end

  def [](i)
    each_with_index do |node, idx|
      return node if i == idx
    end
  end

  def first
    @head
  end

  def last
    curr_node = @head
    curr_node = curr_node.next until curr_node.next.nil?
    curr_node
  end

  def empty?
    @head.nil?
  end

  def get(key)
    each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def include?(key)
    each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    node = Node.new(key,val)
    if empty?
      @head = node
      return node
    end

    curr_node = @head
    curr_node = curr_node.next until curr_node.next.nil?
    
    curr_node.next = node
    node.prev = curr_node
    node
  end

  def update(key, val)
    curr_node = @head
    until curr_node.nil?
      curr_node.val = val if curr_node.key == key
      curr_node = curr_node.next
    end
  end

  def remove(key)
    each do |node|
      @head = @head.next if node == @head && node.key == key
      node.remove if node.key == key
    end
    key
  end

  def each(&blk)
    curr_node = @head
    until curr_node.nil?
      blk.call(curr_node)
      curr_node = curr_node.next
    end
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end
