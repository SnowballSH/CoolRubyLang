require_relative "base_object.rb"

class BaseClass < BaseObject
  attr_accessor :runtime_methods, :runtime_class, :runtime_superclass

  def initialize(superclass=nil)
    @runtime_methods = {}
    @runtime_superclass = superclass
    @runtime_class = Constants["Class"]
  end

  # Lookup a method
  def lookup(method_name)
    method = @runtime_methods[method_name]
    unless method
      if @runtime_superclass
        return @runtime_superclass.lookup(method_name)
      else
        raise "Method not found: #{method_name}"
      end
    end

    method
  end

  def def(name, &block)
    @runtime_methods[name.to_s] = block
  end

  # Create a new instance of this class
  def new
    BaseObject.new(self)
  end

  def new_with_value(value)
    BaseObject.new(self, value)
  end
end
