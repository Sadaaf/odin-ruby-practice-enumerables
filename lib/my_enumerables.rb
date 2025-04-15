module Enumerable
  # Your code goes here
  def my_each_with_index
    if block_given?
      for i in 0...self.length
        yield(self[i], i)
      end
    end
    self
  end

  def my_select
    a = []
    if block_given?
      for i in 0...self.length
        a << self[i] if yield(self[i])
      end
    end
    a
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      for i in 0...self.length
        yield(self[i])
      end
    end
    self
  end
end
