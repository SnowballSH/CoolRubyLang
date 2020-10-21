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

Constants["Class"].def :new do |receiver, arguments|
  receiver.new
end

Constants["Object"].def :puts do |receiver, arguments|
  puts arguments.first.value
  Constants["nil"]
end

Constants["Number"].def :+ do |receiver, arguments|
  result = receiver.ruby_value + arguments.first.ruby_value
  Constants["Number"].new_with_value(result)
end

Constants["Number"].def :- do |receiver, arguments|
  result = receiver.ruby_value - arguments.first.ruby_value
  Constants["Number"].new_with_value(result)
end

Constants["Number"].def :* do |receiver, arguments|
  result = receiver.ruby_value * arguments.first.ruby_value
  Constants["Number"].new_with_value(result)
end

Constants["Number"].def :/ do |receiver, arguments|
  result = receiver.ruby_value / arguments.first.ruby_value
  Constants["Number"].new_with_value(result)
end
