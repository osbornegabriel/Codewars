class Array

  def each
    i = 0
    until i == self.size
      yield(self[i])
      i += 1
    end
  end

end