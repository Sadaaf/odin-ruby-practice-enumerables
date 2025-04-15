module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    my_each do |element|
      yield(element, index)
      index+=1
    end
  end

  def my_select
    result = []
    if block_given?
      my_each do |element|
        result << element if yield(element)
      end
    end
    result
  end

  def my_all?
    if block_given?
      my_each do |element|
        return false if !yield(element)
      end
      return true
    end
  end

  def my_any?
    if block_given?
      my_each do |element|
        return true if yield(element)
      end
      return false
    end
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
