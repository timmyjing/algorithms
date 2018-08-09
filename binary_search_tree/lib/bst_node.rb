class BSTNode
  attr_reader :value
  attr_accessor :right, :left, :parent
  def initialize(value, parent = nil)
    @parent = parent
    @left = nil
    @right = nil
    @value = value
  end
end
