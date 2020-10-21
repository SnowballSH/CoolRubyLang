require "#{File.dirname(__FILE__)}/../src/compile.rb"

# 1 + 3

bytecode = [
  # opcode     operands      stack after     description
  # ------------------------------------------------------------------------
  PUSH_NUMBER, 1,          # stack = [1]     push 1, the receiver of "+"
  PUSH_NUMBER, 2,          # stack = [1, 2]  push 2, the argument for "+"
  CALL,        "+", 1,     # stack = [3]     call 1.+(2) and push the result
  RETURN                   # stack = []
]

result = VM.new.run(bytecode)

p result.value

# 3
