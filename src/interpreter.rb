require_relative "parser"
require_relative "runtime"

class Interpreter
  def initialize
    @parser = Parser.new
  end
  
  def eval(code)
    @parser.parse(code).eval(RootContext)
  end
end

class Nodes
  def eval(context)
    return_value = nil
    nodes.each do |node|
      return_value = node.eval(context)
    end
    return_value || Constants["nil"]  # Last result is return value (or nil if none).
  end
end

class NumberNode
  def eval(context)
    Constants["Number"].new_with_value(value)
  end
end

class StringNode
  def eval(context)
    Constants["String"].new_with_value(value)
  end
end

class TrueNode
  def eval(context)
    Constants["true"]
  end
end

class FalseNode
  def eval(context)
    Constants["false"]
  end
end

class NilNode
  def eval(context)
    Constants["nil"]
  end
end

class GetConstantNode
  def eval(context)
    Constants[name]
  end
end

class GetLocalNode
  def eval(context)
    if receiver
      value = receiver.eval(context)
    else
      value = context.current_self
    end
    value.get_global(name)
  end
end

class SetConstantNode
  def eval(context)
    Constants[name] = value.eval(context)
  end
end

class SetLocalNode
  def eval(context)
    context.locals[name] = value.eval(context)
  end
end

class SetGlobalNode
  def eval(context)
    context.globals[name] = value.eval(context)
    context.current_class.set_global(name, value)
  end
end

class CallNode
  def eval(context)
    if receiver
      value = receiver.eval(context)
    else
      value = context.current_self  # Default to `self` if no receiver.
    end
    
    evaluated_arguments = arguments.map { |arg| arg.eval(context) }
    value.call(method, evaluated_arguments)
  end
end

class DefNode
  def eval(context)
    method = BaseMethod.new(params, body)
    context.current_class.runtime_methods[name] = method
  end
end

class ClassNode
  def eval(context)
    class_ = Constants[name] # Check if class is already defined
    
    unless class_ # Class doesn't exist yet
      class_ = BaseClass.new
      Constants[name] = class_ # Define the class in the runtime
    end
    
    class_context = Context.new(class_, class_)
    body.eval(class_context)
    
    class_
  end
end
