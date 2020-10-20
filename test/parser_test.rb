require "#{File.dirname(__FILE__)}/../src/parser.rb"

code = <<-CODE
def a():
  print("hmm")
end
CODE

parser = Parser.new

p parser.parse(code)
