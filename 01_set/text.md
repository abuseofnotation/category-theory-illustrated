Bear With Me for a Sec
---

Sets
---

A set is a collection of things... Because set theory is, like Category theory, abstract, the things can be anything you want. Consider, for example these balls: 

![Balls](elements.png)
For example let's construct a set, call it A, consisting of *all* of them. This is how we can mark it:
![The set of all balls](all.png)

This may look childish at first, but this set is just as valid as the sets of all natural numbers.

The key difference between a given set of items and the items themselves is that the set summarizes the things which it contains i.e. enables you to reason about several things as if they were one.
 
Subsets
===

Let's construct one more set. The set of *all balls that are warm color*. Again I will give it a name - W:

![W - the set of all balls of warm colors](subset.png)

Notice that W contains just elements that are also present in A. That is, every element of the set of W is also an element in the set A. When two sets have this relation exists, we may say that W is a *subset* of A, and draw a graphic like this one:

![W and A together](set_subset.png)

Singleton Sets
===

The set of all *red balls* contains just one ball:

![The singleton set of red balls](singletone.png)

You may find it contradictory that we say that sets are just for summarizing several elements into one, but we still have sets that contain just one element Actually is perfectly useful. If I ask you to make a set of all books that you are reading right now, you shouldn't have trouble doing it just because you are reading just this one book currently.

The Empty set
===

Of course if 1 is a valid answer, so can be zero. If we want a set of all *black balls* or all the *white balls*, the answer to all these questions is the same - the empty set.

![The empty set](void.png)

Note that two sets that contain the same elements are equivalent, which means that, there is no difference between the set that contains zero *balls*, and the set that contains zero *numbers*, for instance. 

In other words, the empty set is unique set, Which makes it a very special one, as it is indicated by this diagonal string. For example, it is a subset of every other set.

As you might suspect, we will encounter the empty set again.

Functions
---

A function is a relationship between two sets which matches each element of one set, called the *domain* of the function, with exactly one element from another set, called the converse domain, or the *codomain*. 

Here is a function that maps each ball to its opposite color:
![Opposite colors](function_one_one.png)

This is probably the simplest type of function firstly because its domain and codomain are the same set, and secondly, because it expresses a so called one-to-one relationship, which means each element from one set is connected to just one other element from another set.

But a functions are much more powerful than that, because they can also express many-to-one relationships. In a function, there can be many elements from the domain, which relate to the same element from the codomain, but not the other way around.

The domain can be bigger than the codomain in which case several elements from the domain will be mapped to the same element from the codomain:
![Function from a bigger set to a smaller one](function.png)

The domain can be smaller than the codomain in which case some elements from the codomain will not play a part.
![Function from a bigger set to a smaller one](function_small_big.png)

However you cannot have a domain element which is not mapped to anything, or which is mapped to more than one element. In other words (and this is also the reason that functions are the way they are) if you give a function an element of its domain, it should always be able to give you back exactly one element of its codomain. 

Question: Do these functions and sets *express* something? Should a function express something in order to be valid? 

The Identity Function
===

For each set, we can define the function that does nothing, called the identity function - a function in which the set is both domain and codomain, and each element is mapped to itself:

[The identity function]()

You can think of it as the function that represents the set.

Some examples
---

Here are some notable sets and functions that you should know about:

Sets, Functions and Numerical Operation
===

All mathematical operations can be expressed as functions, acting on the set of all numbers. Actually there are several such sets, such the set of positive whole numbers, (also called "natural" numbers), which is called `N`: {1, 2, 3... InfinityTODO}, the set of both positive and negative whole numbers (called `Z` for some reason) and so on.

For example, squaring a number is a function - its domain is the set of all numbers and its codomain is the set of all positive numbers (remember that the square of a number is always positive). Both sets are, of course, infinite. If they weren't I would be able to draw a picture of the square function. 

Now I can draw a part of it (remember that a set can be whatever you want):

[The square function]()

//I just have to connect -1 with 1, 0 with 0, 1 with 1, 2 with 4, 3 with 9 and so on. 


All numbers from the codomain will have two arrows pointing at them (one for the positive square root and one for the negative one), and that is OK. 

Zero from the domain will be connected to the zero from the codomain, so to itself, and this is OK.

Some numbers aren't the square of any other number. That is also OK.

Overall everything is OK, as long as you can always provide exactly one result (also known as "The result") per value, and in mathematics almost always do. Actually most types of numbers were created so mathematical operations are valid functions:

    Every generalisation of number has ﬁrst presented itself as needed for some simple problem: negative numbers were needed in order that subtraction might be always possible, since otherwise a − b would be meaningless if a were less than b; fractions were needed in order that division might be always possible; and complex numbers are needed in order that extraction of roots and solution of equations may be always possible. 


Most mathematical operations, such as addition, multiplication etc. require two numbers in order to produce a result. Depending on what we need, we may present those operations as functions from the sets of *tuples* of numbers, to the set of numbers, or we may say that they take a number and return a function. More on that later.

Sets and Functions in Programming
===

Sets are used extensively in programming, except that there they are called *types* or also *classes*. All sets of number that we discussed earlier also exist as types, and there are also some non-mathematical types:

The simplest type, `Boolen` is nothing more than a set of two values - `true` and `false`:

[Set of boolean values]()

Another very basic set in programming is the set of keyboard characters, or `Char`: 

[Set of characters]()

Characters are actually used rarely by themselves and mostly as parts of sequences.

Most of the types of programming are composite types - they are a combination of the limited types that are listed here. Again, we will cover these later.

Question: What is the equivalent of subsets in programming?

Functions in programming resemble mathematical functions. A function that takes an argument of type `Char` and returns a `Boolean` is nothing more than a mapping between the two sets that we covered above:

[A function from Char to Boolean]()

However functions in programming can also be quite different from mathematical functions - they can perform various operations that have nothing to do with returning a value. These operations are called side effects. Most common programming languages and paradigms were created at a times when the computer resources were much more limited than today, and programming - much more cumberstone, so people had bigger problems than the fact that their functions were not mathematically sound. That is why they didn't have a way to handle side effects, or to differentiate functions that have side effects from the ones that don't. But that is another story.

[For the N-th time, Johnson, we don't care about your monads!]()

Some more examples
===

Sets and functions can express relationships between all kinds of objects, and even people. Every question that you ask is a function. You just have to implement it:

The question "How far are we from New York?" is a function with a domain the set of places in the world and the set of positive numbers as its codomain.

The question "Who is my father?" is a function whose domain is the set of all people in the world and the same set as its codomain. 

Functional Composition and Images
---

Composition
===


If we have two functions and the codomain of one matches the domain of the other...

[Matching functions]()

...we can apply the first function and then apply the second function to the result of the first.

[Functions in parralel]()

The result of the operation is an ordinary function.

[Resulting function]()

When we combine two function into one we say that we are *composing* them. You can compose more than two functions:

[Composing many functions]()

Notice that all of this is only possible because a function always produces exactly one answer.

Composition is the essence of all things categorical. The key insight is that the result of composing two parts is no more complex than the parts themselves. 

Commutative Diagrams
===

The last diagrams demonstrate that the third function is the same as the sequence of the other two by showing that if you follow different the two different arrows coming from one element, you always get to the other one.

[Resulting function, commutativity]()

Diagrams that have this property are called *commutative diagrams*. All diagrams that we show here are commutative.

If we "zoom-out" the last diagram so each set is expressed as just one ball and each function is just one arrow, we get a more general diagram for functional composition.

[Functional composition]()



Isomorphisms
===

Let's go back to the function that we said, demonstrated a one-to-one relationship:

![Opposite colors](function_one_one.png)

Notice that the function is invertible, that is if you flip its arrows you get another valid function:

![Opposite colors](function_one_one_symmetry.png)

Invertible functions are called isomorphisms. When there is an invertible function between two sets, there


