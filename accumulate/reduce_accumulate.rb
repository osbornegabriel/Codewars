module Enumerable
  def accumulate(*operation)
    if operation.size > 0
      operator = operation[-1].to_s
      result = 0
      result = operation[0] if operation[0].is_a?(Integer)
      self.each do |n|
        eval('result' + operator.to_s + '=' + n.to_s)
      end
      return result
    end
  end
end