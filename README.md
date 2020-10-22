# The Scarlet programming language

A **dynamic, object and function oriented, general-purpose** programming language

It is built in ruby.

Speed comparison (relative):

```
Ruby:                       8ms
Scarlet (this):             29ms    (including the code for ruby to execute the interpreter)
Python:                     126ms
Snow (My other language):   1508ms
```

To use the language:

```
ruby <path-to-this-repo>/bin/runfile.rb <filename>.rrr
```

Language tour not available yet.

Compile rule:

```
racc -o parser.rb grammar.y.rb
```
