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

  def my_none?
    if block_given?
      my_each do |element|
        if yield(element)
          return false
        end
        return true
      end
    end
  end

  def my_count
    count = 0
    if block_given?
      my_each do |element|
        count+=1 if yield(element)        
      end
      return count
    end
    return self.length
  end

  def my_map
    result = []
    if block_given?
      my_each do |element|
        result << yield(element)
      end
      return result
    end
  end

  def my_inject(initial_value = nil)
    accumulator = initial_value
    if block_given?
      my_each do |element|
        accumulator = yield(accumulator, element)        
      end
      return accumulator
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
