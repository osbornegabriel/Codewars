module Enumerable


  def accumulate(*operation)
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
    result = operation.first if operation.first.is_a?(Array)
    result << self[0] if operation.first.is_a?(Array)
    i.times do |i|
      index = i + 1
      result ||= values[i]
      result = yield(result, values[index])
    end
    result
  end
end