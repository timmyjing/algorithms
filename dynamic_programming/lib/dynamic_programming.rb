require 'byebug'

class DynamicProgramming

  def initialize
    @blair_cache = {1 => 1, 2 => 2}
  end

  def blair_nums(n)
    return @blair_cache[n] unless @blair_cache[n].nil?

    @blair_cache[n] = blair_nums(n - 1) + blair_nums(n - 2) + (1 + 2 * (n - 2))

    @blair_cache[n]
  end

  def frog_hops_bottom_up(n)
    
  end

  def frog_cache_builder(n)
  end

  def frog_hops_top_down(n)
  end

  def frog_hops_top_down_helper(n)
  end

  def super_frog_hops(n, k)
  end

  def super_frog_cache_builder(n,k)
  end

  def knapsack(weights, values, capacity)
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
  end

  def knapsack(weights, values, capacity)
  end

  def knapsack_table(weights, values, capacity)
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
  