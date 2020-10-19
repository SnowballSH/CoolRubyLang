require './parser.rb'

code = <<-CODE
def method(a, b):
  puts (a + b)
end
CODE

parser = Parser.new

p parser.parse(code)
