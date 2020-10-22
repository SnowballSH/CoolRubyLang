# The Scarlet programming language

A **dynamic, object and function oriented, general-purpose** programming language

It is built in ruby.

Speed comparison for assigning 3 strings to variables(relative):

```
C:                         <0.5  ms
Ruby:                       8.5  ms
Scarlet (this):             29   ms    (including the code for ruby to execute the interpreter)
Python:                     126  ms
Snow (My other language):  >1508 ms
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
