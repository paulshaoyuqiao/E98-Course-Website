# Lab/WWRD Clarifications

WWRD (What Would Ruby Do) is meant to test you on your understanding of how code runs in Ruby, and we mimic the style of irb. However, to focus on certain parts of the code, and because we cannot accept multiple lines without spoiling some aspects of the answer, the answer that you type in for WWRD is different from what you would see in the irb output in several ways:
1. irb uses `=>` to separate the output from `puts` from the return value of the line, while you can omit this symbol in your answers to WWRD.
2. When there are multiple lines, you should separate the multiple lines with `;` followed by a space.
3. We do not ask for the return value of any line that is not the last line of the problem. We do, however, ask for all output from `puts`, no matter what line it is.

So WWRD is not irb, it's pretty different. It's actually more similar to what you would get writing a .rb file and running it, plus the return value of the last line (and the `; `).

### Examples

This is what irb would display:
```
>>> 1 + 2
=> 3

>>> puts "Hi"
Hi
=> nil

>>> a = 3
=> 3
>>> puts a
3
=> nil
>>> puts(a + 2 == 4)
false
=> nil
```
This is what you should type in WWRD to get the correct answer:
```
>>> 1 + 2
3

>>> puts "Hi"
Hi; nil

>>> a = 3
>>> puts a
>>> puts(a + 2 == 4)
3; false; nil
```

### Quick tips for getting unstuck

1. Check for double quotes and nil: `Goose` is not the same as `"Goose"`, `flerken` is not the same as `flerken; nil`
2. Run the code in irb and see if the answer makes sense
3. Contact a TA

### If you're interested

The method `print()` is like `puts()`, but it doesn't print a newline at the end. So:
```
>>> print "I can’t control their fear, only my own"
I can’t control their fear, only my own=> nil
```
We will try not to test weird cases with `print()` in WWRD.

_Last edited: 06/15/2019_
