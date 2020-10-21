require "#{File.dirname(__FILE__)}/../src/interpreter.rb"

code = <<CODE
CODE

Interpreter.new.eval(code)
