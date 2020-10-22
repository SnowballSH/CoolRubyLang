start_ = Time.now
require_relative "../src/interpreter.rb"
Interpreter.new.eval('puts("Hello, world!")')
end_ = Time.now

time = (end_ - start_)*1000

p time
