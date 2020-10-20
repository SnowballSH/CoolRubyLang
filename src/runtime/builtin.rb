Constants = {}

Constants["Class"] = BaseClass.new                 # Defining the `Class` class.
Constants["Class"].runtime_class = Constants["Class"] # Setting `Class.class = Class`.
Constants["Object"] = BaseClass.new                # Defining the `Object` class
Constants["Number"] = BaseClass.new                # Defining the `Number` class
Constants["String"] = BaseClass.new

Constants["BoolClass"] = BaseClass.new
Constants["NilClass"] = BaseClass.new

Constants["true"] = Constants["BoolClass"].new_with_value(true)
Constants["false"] = Constants["BoolClass"].new_with_value(false)
Constants["nil"] = Constants["NilClass"].new_with_value(nil)

Constants["Class"].def :new do |receiver, arguments|
  receiver.new
end

Constants["Object"].def :puts do |receiver, arguments|
  puts arguments.first.value
  Constants["nil"] # We always want to return objects from our runtime
end
