class Context
  attr_reader :locals, :globals, :current_self, :current_class
  
  def initialize(current_self, current_class=current_self.runtime_class)
    @locals = {}
    @globals = {}
    @current_self = current_self
    @current_class = current_class
  end
end
