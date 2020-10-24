class BaseObject
  attr_accessor :runtime_class, :value

  def initialize(runtime_class, value=self)
    @runtime_class = runtime_class
    @value = value
  end

  def call(method, arguments=[])
    @runtime_class.lookup(method).call(self, arguments)
  end

  def get_global(name)
    @runtime_class.get_global(name)
  end
end
