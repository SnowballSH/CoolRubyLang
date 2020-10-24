Constants = {}

Constants["Class"] = BaseClass.new                 # Defining the `Class` class.
Constants["Class"].runtime_class = Constants["Class"] # Setting `Class.class = Class`.
Constants["Object"] = BaseClass.new                # Defining the `Object` class
Constants["Number"] = BaseClass.new(Constants["Object"])  # Defining the `Number` class
Constants["String"] = BaseClass.new(Constants["Object"])

root_self = Constants["Object"].new
RootContext = Context.new(root_self)

Constants["BoolClass"] = BaseClass.new(Constants["Object"])
Constants["NilClass"] = BaseClass.new(Constants["Object"])

Constants["true"] = Constants["BoolClass"].new_with_value(true)
Constants["false"] = Constants["BoolClass"].new_with_value(false)
Constants["nil"] = Constants["NilClass"].new_with_value(nil)

#####################################

def param_check(name, size, args)raise "ArgumentError: method '#{name}' requires more #{size - args.size} arguments" if size > args.size
end

#####################################
# Builtin functions for Main/Class #
#####################################

Constants["Class"].def :new do |receiver, arguments|
  receiver.new
end

#####################################

#####################################
# Builtin functions for Main/Object #
#####################################

Constants["Object"].def :puts do |receiver, arguments|
  param_check("puts", 1, arguments)
  puts *arguments.map{|x| x.value}
  Constants["nil"]
end

Constants["Object"].def :print do |receiver, arguments|
  param_check("print", 1, arguments)
  print *arguments.map{|x| x.value}
  arguments.first.value
end

Constants["Object"].def :repr do |receiver, arguments|
  Constants["String"].new_with_value(receiver.value)
end

#####################################

#####################################
# Builtin functions for Main/String #
#####################################

Constants["String"].def :int do |receiver, arguments|
  result = receiver.value.to_i
  Constants["Number"].new_with_value(result)
end

#####################################

#####################################
# Builtin functions for Main/Number #
#####################################

Constants["Number"].def :+ do |receiver, arguments|
  result = receiver.value + arguments.first.value
  Constants["Number"].new_with_value(result)
end

Constants["Number"].def :- do |receiver, arguments|
  result = receiver.value - arguments.first.value
  Constants["Number"].new_with_value(result)
end

Constants["Number"].def :* do |receiver, arguments|
  result = receiver.value * arguments.first.value
  Constants["Number"].new_with_value(result)
end

Constants["Number"].def :/ do |receiver, arguments|
  result = receiver.value / arguments.first.value
  Constants["Number"].new_with_value(result)
end

#####################################
