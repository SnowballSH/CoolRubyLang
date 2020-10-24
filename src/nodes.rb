class Nodes < Struct.new(:nodes)
  def <<(node)
    nodes << node
    self
  end
end

class LiteralNode < Struct.new(:value); end

class NumberNode < LiteralNode; end

class StringNode < LiteralNode; end

class TrueNode < LiteralNode
  def initialize
    super(true)
  end
end

class FalseNode < LiteralNode
  def initialize
    super(false)
  end
end

class NilNode < LiteralNode
  def initialize
    super(nil)
  end
end

# The node for a method call holds the `receiver`,
# the object on which the method is called, the `method` name and its
# arguments, which are other nodes.
class CallNode < Struct.new(:receiver, :method, :arguments); end

# Retrieving the value of a constant by its `name` is done by the following node.
class GetConstantNode < Struct.new(:name); end

# And setting its value is done by this one. The `value` will be a node. If we're
# storing a number inside a constant, for example, `value` would contain an instance
# of `NumberNode`.
class SetConstantNode < Struct.new(:name, :value); end

# Similar to the previous nodes, the next ones are for dealing with local variables.
class GetLocalNode < Struct.new(:receiver, :name); end

class GetGlobalNode < Struct.new(:receiver, :name); end

class SetLocalNode < Struct.new(:name, :value); end

class SetGlobalNode < Struct.new(:name, :value); end

# Each method definition will be stored into the following node. It holds the `name` of the method,
# the name of its parameters (`params`) and the `body` to evaluate when the method is called, which
# is a tree of node, the root one being a `Nodes` instance.
class DefNode < Struct.new(:name, :params, :body); end

# Class definitions are stored into the following node. Once again, the `name` of the class and
# its `body`, a tree of nodes.
class ClassNode < Struct.new(:name, :body); end
