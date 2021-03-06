require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @prc = prc
    @max = max
    @count = 0
  end

  def count
    count
  end

  def get(key)

  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = @prc.call(key)
    @map.set(key, val)
    @store.append(val)
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
  end

  def eject!
  end
end
