require 'byebug'

class DynamicProgramming

  def initialize
    @blair_cache = {1 => 1, 2 => 2}
    @frog_cache = {0 => [[]], 1 => [[1]]}
  end

  def blair_nums(n)
    return @blair_cache[n] unless @blair_cache[n].nil?

    @blair_cache[n] = blair_nums(n - 1) + blair_nums(n - 2) + (1 + 2 * (n - 2))

    @blair_cache[n]
  end

  def frog_hops_bottom_up(n)
    return @frog_cache[n] if @frog_cache[n]

    frog_cache_builder(n)


    @frog_cache[n]
  end

  def frog_cache_builder(n)
    1.upto(n).each do |steps|
      next unless @frog_cache[steps].nil?
      cache = []
      1.upto(3).each do |k|
        if k <= steps
          cache += @frog_cache[steps - k].map{ |el| el + [k]}
        end
      end
      @frog_cache[steps] = cache
    end
  end

  def frog_hops_top_down(n)
    return @frog_cache[n] if @frog_cache[n]

    frog_hops_top_down_helper(n)

    @frog_cache[n]
  end

  def frog_hops_top_down_helper(n)
    n.downto(1).each do |steps|
      
    end
  end

  def super_frog_hops(n, k)
  end

  def super_frog_cache_builder(n,k)
  end

  def knapsack(weights, values, capacity)
    # create knapsack table
    table = knapsack_table(weights,values, capacity)
    table[table.length - 1][capacity]
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    table = Array.new(weights.length) {Array.new(capacity)}
    weights.length.times do |w|
      (capacity + 1).times do |c|
        if w == 0
          if weights[w] > c
            table[w][c] = 0
          else
            table[w][c] = values[w]
          end
          next
        end

        if weights[w] <= c
          table[w][c] = [table[w -1][c], values[w] + table[w - 1][c - weights[w]]].max
        else
          table[w][c] = table[w-1][c]
        end

      end
    end
    table
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
  