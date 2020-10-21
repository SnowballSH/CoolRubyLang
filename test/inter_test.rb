require "#{File.dirname(__FILE__)}/../src/interpreter.rb"

code = <<CODE
def a{
  puts("mhm")
}
puts(a!)
CODE

Interpreter.new.eval(code)
