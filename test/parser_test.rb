require './parser.rb'

code = <<-CODE
def a():
  print("hmm")
end
CODE

parser = Parser.new

p parser.parse(code)
