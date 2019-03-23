module Enumerable

  def accumulate(*operation)
    raise Error if !block_given? && ( operation.empty? || !operation.last.is_a?(Symbol) )
    raise Error if block_given? && operation.first.is_a?(Symbol)
    raise Error if operation.include?(nil)
    raise Error if operation.count {|val| val.is_a?(Symbol)} > 1
    if !block_given?
      operator = operation[-1].to_s
      result = 0
      result = operation[0] if operation[0].is_a?(Integer)
      self.each do |n|
        eval('result' + operator.to_s + '=' + n.to_s)
      end
      return result
    end
    values = Array(self)
    i = values.size - 1
    result = operation.first if operation.first.is_a?(Array) || operation.first.is_a?(Hash)
    result << self[0] if operation.first.is_a?(Array)
    result = yield(result, values[0]) if operation.first.is_a?(Hash)
    i.times do |i|
      index = i + 1
      result ||= values[i]
      result = yield(result, values[index])
    end
    result
  end
end