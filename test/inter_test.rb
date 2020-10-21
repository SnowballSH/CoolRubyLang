require "#{File.dirname(__FILE__)}/../src/interpreter.rb"

code = <<CODE
puts((3+4)*5)
CODE

Interpreter.new.eval(code)
