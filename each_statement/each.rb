class Array

  def each
    i = 0
    until i = self.size
      yield
      i += 1
    end
  end

end