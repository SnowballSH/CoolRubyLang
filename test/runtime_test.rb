require "#{File.dirname(__FILE__)}/../src/runtime"

object = Constants["true"]

p object.runtime_class.runtime_superclass == Constants["Object"]
