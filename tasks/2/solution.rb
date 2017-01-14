class Array
  def fetch_deep(path)
    a = path.split('.')
    return self[a[0].to_i] if a.length == 1

    self[a[0].to_i].fetch_deep(path[a[0].length + 1..-1])
  end
end

class Hash
  def fetch_deep(path)
    a = path.split('.')
    return self[a[0].to_sym] if a.length == 1
    self[a[0].to_sym].fetch_deep(path[a[0].length + 1..-1])
  end

  def reshape(shape)
    shape.each do |index, value|
      self[index] = self.fetch_deep(value)
    end
  end
end