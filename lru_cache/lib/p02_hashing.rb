class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    map.with_index {|el, i| el.hash * i.hash}.inject(0, :+)
  end
end

class String
  def hash
    return ord.hash if length <= 1
    return chars.hash if length > 1
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    keys.sort.hash + values.sort.hash
  end
end
