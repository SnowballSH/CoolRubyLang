require_relative "../src/interpreter.rb"

def main
  filename = ARGV.pop
  unless filename
    puts "Filename not found."
    return 1
  end

  file = File.open(filename).read
  unless file
    puts "Cannot open file: #{filename}"
    return 1
  end

  Interpreter.new.eval(file)

  return 0
end

main()
