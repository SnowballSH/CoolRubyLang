class Lexer
  KEYWORDS = %w[def class if else false true nil end].freeze

  def tokenize(code)
    code.chomp!
    i = 0
    tokens = []

    while i < code.size
      chunk = code[i..-1]

      if comment = chunk[/\A#(.*?)/, 1]
        i += comment.size + 1

      elsif identifier = chunk[/\A([a-z]\w*)/, 1]
        tokens << if KEYWORDS.include?(identifier)
                    [identifier.upcase.to_sym, identifier]
                  else
                    [:IDENTIFIER, identifier]
                  end
        i += identifier.size

      elsif constant = chunk[/\A([A-Z]\w*)/, 1]
        tokens << [:CONSTANT, constant]
        i += constant.size

      elsif number = chunk[/\A([0-9]+)/, 1]
        tokens << [:NUMBER, number.to_i]
        i += number.size

      elsif string = chunk[/\A"(.*?)"/, 1]
        tokens << [:STRING, string]
        i += string.size + 2

      elsif res = chunk[/\A(==)/, 1]
        tokens << [:DBEQ, "=="]
        i += 2

      elsif res = chunk[/\A(!=)/, 1]
        tokens << [:NTEQ, "!="]
        i += 2


      elsif res = chunk[/\A(<=)/, 1]
        tokens << [:LTEQ, "<="]
        i += 2

      elsif res = chunk[/\A(>=)/, 1]
        tokens << [:GTEQ, ">="]
        i += 2

      elsif res = chunk[/\A(<)/, 1]
        tokens << [:LT, "<"]
        i += 1

      elsif res = chunk[/\A(>)/, 1]
        tokens << [:GT, ">"]
        i += 1

      elsif res = chunk[/\A(&&)/, 1]
        tokens << [:AND, "&&"]
        i += 2

      elsif res = chunk[/\A(\|\|)/, 1]
        tokens << [:OR, "||"]
        i += 2

      elsif chunk.match(/\A([\r\n]+)/)
        tokens << [:NEWLINE, "\n"]
        i += 1

      elsif chunk.match(/\A /)
        i += 1

      else
        value = chunk[0, 1]
        tokens << [value, value]
        i += 1

      end

    end

    tokens
  end
end
