class Array
  def shuffle!
    size.downto(1) { |n| push delete_at(Kernel.rand(n)) }
    self
  end
end

class Fixnum
  def even?
    (self % 2) == 0
  end

  def odd?
    (self % 2) == 1
  end
end

class Module
  def memoized_finder (name, conditions = nil)
    class_eval <<-STR
      def #{name} (reload = false)
        @#{name} = nil if reload
        @#{name} ||= find(:all, :conditions => #{conditions.inspect})
      end
    STR
  end
end
