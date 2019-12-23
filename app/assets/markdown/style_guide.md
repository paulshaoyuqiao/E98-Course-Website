# Introduction to Computer Science Bootcamp: Ruby Style Guide

_A developer who doesn't care about style is like an artist, a painter, who doesn't care about color._ -- from [this Stackoverflow post](https://stackoverflow.com/questions/127916/is-programming-style-important-how-important).

_Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live._ -- Martin Golding

When you first start coding, you might wonder why code composition is important. After all, your code is meant to run on computers, and any code style will become irrelevant once it's compiled or interpreted into machine code.

However, when you need help or work in a software company, others will inevitably read the code that you have written. Moreover, even if you're modifying your own code, straightforward logic, consistent style, and informative names and comments will save tons of time and resources. I cannot stress enough how important readable code is.

Sometimes, we will write code some way because the feel like it will be faster. If we can just use some value, why save it in a variable first and _then_ use it, even if that makes the code a bit easier to understand? Well first of all, small things like this have basically no influence on actual code speed, because computers are really fast. If you want your code to be faster, there are other things you can do that are way more efficient. Also, the library, compiler, or interpreter does some optimization of its own, so things you think will be slower might actually turn out to be faster; the only way to know for sure is to time your code. The point is, making code easily understood is way more important than being "clever" (read: esoteric).

This guide is based on the [CS61A Style Guide](https://cs61a.org/articles/composition.html), which is written for Python instead of Ruby.

## General

Limit lines to 80 characters. Generally, each line of code has a singular purpose, otherwise code can be difficult to understand and debug.

[CS61B](https://sp18.datastructur.es/materials/guides/style-guide.html), which uses Java, strictly enforces a 100-character limit. However, Ruby code is much more compact than Java code.

Don't add trailing whitespaces (spaces, tabs) to the end of a line.

## Naming

Names should be meaningful. To a computer, variable or method names do not matter. However, humans who read variable names should know what the variable is used for.

```ruby
# Bad
asdf = 5

# Good
number_of_users = 5
```

Short names can be used to represent numbers if there is context.

```ruby
# Coordinates
x = 6
y = 5

# Index
i = 0
```

Use lower-case letters and underscores for variable names.

```ruby
# Bad
NumberOfUsers = 5

# Good
number_of_users = 5
```

Use CamelCase for Classes.

```ruby
# Bad
class many_users

# Good
class ManyUsers
```

## Spacing and Indentation

Use spaces instead of tabs. This allows consistency between different text editors.

Use two spaces for indentation. For other languages such as Python, using four spaces is the norm. However, the Ruby community has agreed on two-space indentations, primarily for readability reasons. Here is [more information](https://stackoverflow.com/questions/6741586/rails-coding-standards-why-2-space-indentation#6741657).

```ruby
# Bad Style
def method
    body
end

# Good Style
def method
  body
end
```

Add spaces between operators, such as `+` and `–` . You can decide if you want to add spaces around `*` or `/` , but be consistent.

```ruby
# Bad
a = 1+5-6*7+8/5

# Good
a = 1 + 5 - 6 * 7 + 8 / 5
# Or
a = 1 + 5 - 6*7 + 8/5
```

Add spaces after commas.

```ruby
# Bad
numbers = [1,0,7,5,6]

# Good
numbers = [1, 0, 7, 5, 6]
```

Don't add spaces after `(` and `[`, and before `)` and `]`. Add spaces before and after `{}`.

```ruby
# Bad
a = ( 1 + 3 ) * 4
numbers = [ 1, 2, 3 ]
numbers.each{|e| puts e}

# Good
a = (1 + 3) * 4
numbers = [1, 2, 3]
numbers.each { |e| puts e }
```

Don't add space after `!`

```ruby
# Bad
! true

# Good
!true
```

Add newlines between methods.

```ruby
# Good

def plus_one(x)
  return x + 1
end

def plus_two(x)
  return x + 2
end
```

Don't use multiple newlines.

```ruby
# Bad

def plus_one(x)
  return x + 1
end



def plus_two(x)
  return x + 2
end
```

Don't use newlines around method or class bodies.

```ruby
# Bad
class SampleClass

  def plus_one(x)

    return x + 1

  end

end

# Good
class SampleClass
  def plus_one(x)
    return x + 1
  end
end
```

Add underscores to large numbers for better visibility.

```ruby
# Bad
a = 1000000000000000

# Good
a = 1_000_000_000_000_000
```
In this case you could also use scientific notation, i.e. `1e15`
## Booleans

Don’t use `and` and `or`. Instead, use `&&` and `||`. Using `and` and `or` can make your program behave in unexpected ways. See [this StackOverflow post](https://stackoverflow.com/questions/1426826/difference-between-and-and-in-ruby) if you’re interested.

```ruby
# Bad
a and b
a or b

# Good
a && b
a || b
```

## Control Structures
Don't compare a boolean variable to `true` or `false`. The `!` operator flips the boolean value.

```ruby
# Bad
if a == true
  ...
elsif b == false
  ...
end

# Good
if a
  ...
elsif !b
  ...
end
```

## Comments

Comments are used to explain code, both for yourself and the reader. A rule of thumb is to think about whether a person can understand your code without prior knowledge. If this is not the case, and you have followed style guidelines, then add comments. Otherwise, comments are a good way to keep track of what you have implemented.

For most production-level code, every class and non-trivial method requires documentation, as do complicated blocks of code. However, in this class we will not force you to document any classes or methods.

Comments start with a `#`.

```ruby
# This is a comment
```

_Last edited: 06/15/2019_
