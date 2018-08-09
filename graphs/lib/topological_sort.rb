require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms
# Khans

def topological_sort(vertices)
  queue = vertices.select {|vertex| vertex.in_edges.empty?}
  visited = []
  until queue.empty?
    vertex = queue.shift
    visit(vertex, visited)
    queue += vertices.select {|vertex| vertex.in_edges.empty? && !visited.include?(vertex)}
  end
  p visited.length
  (vertices - visited).length == 0 ? visited : []
end


def visit(n, list)
  out = n.out_edges
  out.each {|edge| edge.destroy!}
  list << n
end