## What's an Integer?

You've been dealing with integers for a while now:

```
x = 5
```

But still, have you ever wondered: what is an integer, anyway?

I mean, mathematically, an integer is any number without fractional parts, like 3, 0, or -10. But what is an integer in programming? How is it stored and used?

Well, everything in a computer is stored as 0s and 1s. An integer is stored in its binary form:

```
0 -> 0000
1 -> 0001
2 -> 0010
3 -> 0011
4 -> 0100
```

For example on a hard drive, this will be encoded in different directions in the material's magnetic field. When the CPU is doing calculations, it will be voltages on different wires.

When the computer adds or subtracts two numbers, it does the calculation in binary. This actually makes the computations very simple. The computer only converts the number to decimal when you want to print it out (`puts x`).

Wait, you say. What about negative numbers?

Well, that's a bit more complicated. I won't give all the details here, but most of the time we use something called two's complement. It looks something like this:

```
-1 -> 1111
-2 -> 1110
-3 -> 1101
-4 -> 1100
```

This might look weird, but it actually makes a lot of sense in terms of efficiency. Notice that if we calculate -1 + 1, we get `1111 + 0001 = 0000` (the leftmost carry overflows and poofs out of existence). You will learn more about this in CS 61C.

There is still one problem. When you create an integer, you need to specify how much memory you give it. If you give it 4 bits of memory, then you can store 0000 to 1111, which using two's complement is the numbers -8 (`1000`) through 7 (`0111`). But I don't remember doing that when I was writing my `age_in_seconds.rb` program!

Well it turns out, when you create an integer in Java or some other statically-typed language, you do need to specify how much memory your integer is gonna have. If you try to add 1 to the biggest integer, it will overflow and become the smallest negative number. The largest possible `int` in Java is 2147483647, and Java programmers are forever haunted by the fear of integer overflow.

However in languages like Ruby and Python, the language takes care of integer overflow under the hood. When an integer is about to overflow, the program just allocates more memory to it. Isn't that smooth.

Okay, now we know all about integers. So then how are fractional numbers stored?

Oh, don't even get me started.

## Methods or Functions?

Uhh I don't really have anything to write here...

## MORE Recursion (As If You Haven't Had Enough)

After we managed to finish that chapter of recursion that is now official material, the recursion videos made earlier became kind of obsolete. We still ask you to watch the first one, but part II and III have mostly retired. However, if you're interested, feel free to watch them and keep them from feeling lonely.

[Recursion Part 2: The Recursive Leap of Faith & Iteration Vs. Recursion](https://youtu.be/1fzwDIi5DOY)

[Recursion Part 3: Tree Recursion](https://youtu.be/RWOpAb1EGkc)

## Stacking the Recursion

Hopefully, you now have an idea of what recursion is. Coding-wise, it's when a method calls itself to solve a smaller subproblem. However, how does recursion work under the hood?

Well first, let me introduce you to the stack.

A stack is like an array, except that new items must be inserted on the top, and when you delete items, you also are only allowed to remove the top one. It's like a stack of plates: you can't access anything in the middle or bottom.

![A Stack](stack.png)

_Note: This image is not meant to contain any Endgame spoilers._

Well it turns out, the part of memory that executes functions is a stack, and it's called, well, the stack. But instead of Marvel superheroes, it contains methods (and also it grows down instead of up, so yeah).

![The Stack Frame](stack_frame.png)

Each frame of the stack is a method, and contains stuff about this method the computer needs to know, like who it was called by, what local variables it has, etc. When you call a new method, a new frame is added under the stack. When you exit a method, a frame is popped off.

Note that the stack doesn't grow very deep if you just call one method at a time:

```
def f()
  print(1)
end

f()
f()
f()
```

In this case, even though we call `f` three times, we always exit it before calling it again. Because of this, the stack grows, shrinks, grows, shrinks, grows, and shrinks again. It never gets deeper than one frame (or two frames if you count the `print`, and three frames if you count the main method; hey I'm trying to be simple here, okay?).

However, if you call a method inside another method, the stack grows deeper:


```
def f()
  g()
end

def g()
  h()
end

def h()
  print(1)
end

f()
```

Okay so far, we haven't talked about recursion yet. What does the stack have to do with recursion? Well, the stack handles methods, and recursion involves calling the same method over and over again. So when you're doing recursion, you're really just asking the Ruby interpreter to create a stack data structure.

Now that we have that out of the way, let's move on to the most famous debate of computer science (not really, but it's an interesting question): Which is better, iteration or recursion?

If you've watched the optional recursion videos titled _MORE Recursion (As If You Haven't Had Enough)_, then you've already seen a comparison, but now that we know about stacks, the differences are easier to explain.

As we've seen, any iterative algorithm can be written recursively, but some recursive algorithms, like tree recursion, cannot be converted to iteration easily. But actually, that's not entirely true. I've just told you that recursion is just iteration with a stack. So if you're allowed to use a stack, any recursion can be converted to iteration, though it might take a bit of work.

Sometimes, however, you might not even need the stack, but the recursive version always uses it anyway. Because of this, recursive methods sometimes waste memory. Moreover, using the computer's stack is often less efficient than creating one yourself (for example using a Ruby array), so if you don't mind the extra work, using iteration with a stack is more efficient than using recursion. However, we don't always care that much about squeezing every last bit of efficiency out of our programs, so recursion is still very useful. Moreover, it's a great learning exercise, and it's fun!

## All Hail Sorting, the Lightsaber of Programmers

Back in the days, when we actually asked you to read chapter 10 of the textbook... Sorting was officially part of this course.

Well, sorting *is* cool. It was just too much for us to ask you in an introductory programming course. However, if you're still interested, we still have our old sorting videos available.

But first, some context. What is sorting? Sorting is taking in an array of comparable things (e.g. numbers, strings) and outputting a sorted version of them, where the items are ordered from least to greatest. So if given `4 2 5 1 3` you output `1 2 3 4 5`.

Now, the videos:

[Sorting Part 1: Introduction to Sorting](https://youtu.be/_0R6ZT2Pgk8)

[Sorting Part 2: More on Sorting](https://youtu.be/OgwEmmTwcQM)

These videos introduce selection sort and insertion sort. However, these to sorting algorithms are rarely used in practice, because they are agonizingly slow. Some better algorithms are merge sort and quicksort. If you would like to learn about them, take CS 61B (or just do some googling).

## There is ABSOLUTELY a Lot to Learn in Chapter 10

We did not ask you to read chapter 10, because we found it to be difficult, a lot of work, and not well explained. However, beauty is in the eye of the beholder. If you wish, you can try reading Chapter 10 of _Learn to Program_, and maybe even try out some of the exercises.

A warning before you start: The title is misleading. There is _absolutely_ a lot to learn in chapter 10.
