require_relative "base_object.rb"

class BaseClass < BaseObject
  attr_accessor :runtime_methods, :runtime_globals, :runtime_class, :runtime_superclass

  def initialize(superclass=nil)
    @runtime_methods = {}
    @runtime_globals = {}
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
        raise "NameError: '#{method_name}' is not defined'"
      end
    end

    method
  end

  def get_global(name)
    glb = @runtime_globals[name]
    unless glb
      if @runtime_superclass
        return @runtime_superclass.get_global(name)
      else
        raise "NameError: name '#{name}' is not defined"
      end
    end
    glb
  end

  def def(name, &block)
    @runtime_methods[name.to_s] = block
  end

  def set_global(name, val)
    @runtime_globals[name.to_s] = val
  end

  # Create a new instance of this class
  def new
    BaseObject.new(self)
  end

  def new_with_value(value)
    BaseObject.new(self, value)
  end
end
