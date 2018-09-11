class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc || Proc.new {|a,b| a <=> b}
    @store = []
  end

  def count
    @store.length
  end

  def extract
  end

  def peek
  end

  def push(val)
  end

  public
  def self.child_indices(len, parent_index)
    [parent_index * 2 + 1, parent_index * 2 + 2].select {|el| el < len}
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new {|a,b| a <=> b}
    # a <=> b 1 if greater, 0 if equal, -1 if less 
    # b <=> a 1 if b is greater, 0 if equal, -1 if b is less
    child = child_indices(len, parent_idx)
    if child.any? {|idx| prc.call(array[parent_idx], array[idx]) == 1}
      if child.length == 1 || prc.call(array[child[0]], array[child[1]]) == -1 
        larger = child[0]
      else
        larger = child[1]
      end
      array[parent_idx], array[larger] = array[larger], array[parent_idx]
      heapify_down(array, larger, len, &prc)
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx == 0
    prc ||= Proc.new {|a,b| a <=> b}
    parent_idx = parent_index(child_idx)
    if prc.call(array[parent_idx], array[child_idx]) == 1
      array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]
      heapify_up(array, parent_idx, len, &prc)
    end
    array
  end

end