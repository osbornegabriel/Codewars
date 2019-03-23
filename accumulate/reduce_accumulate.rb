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
    i.times do |i|
      index = i + 1
      result ||= values[i]
      result = yield(result, values[index])
      result
    end
    result
  end
end