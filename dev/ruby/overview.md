Ruby
====

Check syntax:

```
ruby -c [filename]
```

Basics
------

```
x = 1
'simple string'
"Embed variable #{x}"

true
false
nil (== false)
0 != false

print "string"
puts "string" # same as print, but adds a new line

if false
  # ...
elsif nil
  # ...
else
  # ...
end

case x
  when "fish"
    # ...
  when "dog", "cat", "monkey"
    # ...
  else
    # ...
end
```

Arrays
======

```
x = ["a", "b", "c"] # => ["a", "b", "c"]
x[0]                # => "a" (zero is the first index)
x.first             # => "a" (see?)
x.last              # => "c"
x + ["d"]           # => ["a", "b", "c", "d"]
x                   # => ["a", "b", "c"] ( x is unchanged)
x = x + ["d"]       # => ["a", "b", "c", "d"]
x                   # => ["a", "b", "c", "d"]
```

Hash
====

- Key / values
- No set order

```
h = {
  "first_name" => "Bob",
  "last_name"  => "Jones"
}
h.keys              # => ["first_name", "last_name"]
h["first_name"]     # => "Bob"
h["last_name"]      # => "Jones"
h["age"] = 23
h.keys              # => ["first_name", "age", "last_name"]
h.values            # => ["Jones", "Bob", 23]
```

Regex
=====

```
"I believe"  =~ /I/                       # => 0 (matches at the first character)
"I believe"  =~ /lie/                     # => 4 (matches at the 5th character)
"I am human" =~ /bacon/                   # => nil (no match - bacon comes from pigs)
"I am human" !~ /bacon/                   # => true (correct, no bacon here)
/give me a ([0-9]+)/ =~ "give me a 7"     # => 0 (matched)
```

Functions
=========

```
def function_name(first_argument, second_argument)
  puts "You gave me #{first_argument} and #{second_argument}"
end

do_something_useless("apple", "banana")
do_something_useless "apple", "banana" # parenthesis' are optional
```

Output
======

```
<%= escaped %>
<%== raw %>
```