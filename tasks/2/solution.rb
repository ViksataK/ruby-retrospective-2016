class Array
  def fetch_deep(path)
    key, rest_of_path = path.split('.', 2)
    value = get_value(key)
    return value if rest_of_path.nil? || value.nil?
    value.fetch_deep(rest_of_path)
  end

  def get_value(key)
    self[Integer(key)]
  end

  def reshape(shape)
    map { |el| el.reshape(shape) }
  end
end

class Hash
  def fetch_deep(path)
    key, rest_of_path = path.split('.', 2)
    value = get_value(key)
    return value if rest_of_path.nil? || value.nil?
    value.fetch_deep(rest_of_path)
  end

  def get_value(key)
    self[key] || self[key.to_sym]
  end

  def reshape(shape)
    shape.map do |k, v|
      v.is_a?(Hash) ? [k, reshape(v)] : [k, fetch_deep(v)]
    end.to_h
  end
end