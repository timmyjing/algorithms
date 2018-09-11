# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'
require 'byebug'

class BinarySearchTree
  attr_reader :root

  def initialize(root = nil)
    @root = root
  end

  def insert(value)
    if root.nil?
      @root = BSTNode.new(value)
    elsif value > root.value
      if root.right.nil?
        root.right = BSTNode.new(value)
      else
        BinarySearchTree.new(root.right).insert(value)
      end
    else
      if root.left.nil?
        root.left = BSTNode.new(value)
      else
        BinarySearchTree.new(root.left).insert(value)
      end
    end
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    return tree_node if tree_node.value == value
    if tree_node.value > value
      find(value, tree_node.left)
    else
      find(value, tree_node.right)
    end
  end

  def delete(value)
    node = find(value)
    return if node == nil
    @root = nil if node == root

  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if tree_node.right.nil?
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
  end 

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

end
