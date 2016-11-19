Bear With Me for a Set
===

Sets
===

A set is a collection of things... Because set theory is, like Category theory, abstract, the things can be anything you want. Consider, for example these balls: 

![Balls](elements.svg)
For example let's construct a set, call it **G** (as grey), consisting of *all* of them. This is how we can mark it:

![The set of all balls](all.svg)

The example may look childish, but in fact this set is just as valid as any other.

The things that are contained in the set are called its *elements*. A set is like a summary of its elements, i.e. it enables you to reason about several things as if they were one.
 
Subsets
---

Let's construct one more set. The set of *all balls that are warm color*. I will call it **Y** ,because in the graphic its coloured in **y**ellow.

![W - the set of all balls of warm colors](subset.svg)

Notice that W contains just elements that are also present in **G**. That is, every element of the set of **Y** is also an element in the set **G**. When two sets have this relation, we may say that **Y** is a *subset* of **G** (or **Y ⊆ G**), and draw a graphic like this one:

![W and A together](set_subset.svg)


Singleton Sets
---

The set of all *red balls* contains just one ball.

![The singleton set of red balls](singleton.svg)

Above I said that sets are all about for summarizing *several* elements into one, but still sets that contain just one element are perfectly valid. Simply, there are things which are one of a kind. Furthermore if I have a function which expects a set of given items, here shouldn't be any issue if the "items" are just one item (if I ask you to make a set of all books that you are reading right now, you shouldn't have trouble doing it just because you cannot read several books simultaneously).

The Empty set
---

Of course if one is a valid answer, so can be zero. If we want a set of all *black balls*  **B** or all the *white balls*, **W**, the answer to all these questions is the same - the empty set. Or in other words.

![The empty set](void.svg)


Note that a set is defined only by the items it contains, which means that there is no difference between the set that contains zero *balls*, and the set that contains zero *numbers*, for instance. In other words, the empty set is *unique* set, which makes it a very special one. Formally, the empty set is marked with the symbol **∅** (so **B = W = ∅**).

The empty set is a special one, for example, it is a subset of every other set (mathematically speaking, **∀ A | A ⊆ ∅**)

We will encounter the empty set again.

Functions
===

A function is a relationship between two sets which matches each element of one set, called the *domain* of the function, with exactly one element from another set, called the converse domain, or the *codomain* of the function.

Here is a function, **f** which maps each ball from the set **R** to the ball with the opposite color in another set **G** ( in mathematics a function's name is often acompanied by the names of its domain and codomain, like this: **f: R → G**)

![Opposite colors](function_one_one.svg)

This is probably one of the simpler types of functions there exists. That is because it encodes a *one-to-one relationship* between the sets - *one* element from the domain is connected to exactly *one* element from the codomain and the other way around.

But functions can also express relationships of the type *many-to-one*, where *many* elements from the domain might relate to *one* element from the codomain (but not the other way around).

For example a function can express a relationship in which several elements from the domain relate to the same element of the codomain.

![Function from a bigger set to a smaller one](function_big_small.svg)

It can also express relationships in which some elements from the codomain do not play a part.

![Function from a smaller set to a bigger one](function_small_big.svg)

One thing that you cannot have is a function in which a domain element is not mapped to anything, or is mapped to more than one codomain element. That would mean the relationship expressed by it is *many-to-many*, and as we said in the beginning, functions only model many-to-one relationships. There is a reason for this, and we will discuss it shortly.

Sets and functions can express relationships between all kinds of objects, and even people. Every question that you ask can most probably be expressed as a function.

The question "How far are we from New York?" is a function with a domain the set of places in the world and a codomain, consisting of the set of all positive numbers 

Question: Some people might say that the codomain of the function is bigger than it should be. How would you refine it?

The question "Who is my father?" is a function whose domain is the set of all people in the world.
Question: What is the codomain of this function?

Note that the question "Who is my child?" is *NOT* a straightforward function, because a person can have no children, or can have multiple children. We will learn to represent such questions as functions later.

Question: Do all functions that we drew at the beginning *express* something? Do you think that a function should express something in order to be valid? 

The Identity Function
---

For every set **G**, no matter what it represents, we can define the function that does nothing, or in other words a function which maps every element G to itself. It is called the *the identity function* of **G** or **idG: G → G**.

![The identity function](function_identity.svg)

You can think of **idG** as a function which represents the set **G** in the realm of functions. It's existence allows us to prove many theorems, that we "know" by intuition, formally.

Functions and Subsets
---
For each set and subset, no matter what they represent, we can define the function that maps each element of the subset to itself:

![Function from a smaller set to a bigger one](function_small_big.svg)

Every set is a subset of itself, in which case this function is the same as the identity.

Functions and the Empty Set
---

There is a unique function from the empty set to any other set.

![Function with empty set](function_empty.svg)

Question: Is this really valid? Why? Check the definition.

Note that this statement is also a result from the one saying that there is a function between a Subset and a Set, and the one that says that the empty set is a subset of any other set.

Question: What about the other way around. Are there functions with the empty set as a codomain as opposed to a domain?

Functions and Singleton Sets
---

There is a unique function from any set to any singleton set.

![Function with a singleton set](function_singleton.svg)

Question: Is this really the only way to connect *any* set to a singleton set in a valid way?

Question: Again, what about the other way around?

Sets, Functions and Numerical Operation
===

All mathematical operations can be expressed as functions, acting on the set of numbers. Actually there are several such sets, such the set of positive whole numbers, (also called "natural" numbers), **N := {1, 2, 3... ∞}**, the set of both positive and negative whole numbers **Z := {-∞... -3 -2, -1, 0, 1, 2, 3... ∞}**.

For example, squaring a number is a function from the set of all numbers to the set of all positive numbers (because both sets are infinite, we cannot draw them in their entirety, however we can draw a part of them).

![The square function](square.svg)

I will use the occasion to reiterate some of the more important characteristics of functions:

- All numbers from the codomain have (or should have) two arrows pointing at them (one for the positive square root and one for the negative one), and that is OK. 

- Zero from the domain is connected to itself in the codomain, and that is OK.
- Some numbers aren't the square of any other number. That is also OK.

Overall everything is OK, as long as you can always provide exactly one result (also known as *The result™*) per value, and in mathematics almost always do. Actually math is designed in a way so its operations are valid functions:

> Every generalisation of number has ﬁrst presented itself as needed for some simple problem: negative numbers were needed in order that subtraction might be always possible, since otherwise a − b would be meaningless if a were less than b; fractions were needed in order that division might be always possible; and complex numbers are needed in order that extraction of roots and solution of equations may be always possible.

Note that most mathematical operations, such as addition, multiplication etc. require two numbers in order to produce a result. This does not mean that they are not functions, it means that they are just a little more fancy ones. Depending on what we need, we may present those operations as functions from the sets of *tuples* of numbers to the set of numbers, or we may say that they take a number and return a function. More on that later.

Sets and Functions in Programming
===

Sets are used extensively in programming, except that there they are called *types* or also *classes*. All sets of numbers that we discussed earlier also exist in most languages as types, and there are also some non-mathematical types that play a huge role in programming.

The simplest type, `Boolen` is nothing more than a set of two values - `true` and `false`:

![Set of boolean values](boolean.svg)

Another very basic set in programming is the set of keyboard characters, or `Char`: 

![Set of characters](char.svg)

Characters are actually used rarely by themselves and mostly as parts of sequences.

Most of the types of programming are composite types - they are a combination of the primitive types that are listed here. Again, we will cover these later.

Question: What is the type equivalent of subsets in programming?

Question: Do you recognize some of the functions we defined in programming languages you know?

Some functions in programming (also called methods, subroutines, etc.) kinda resemble mathematical functions - they sometimes take one value of a given type (or in other words, and element that belong to a given set) and always return exactly one element which belongs to another type (or set). For example here is a function which that takes an argument of type `Char` and returns a `Boolean`, depending whether the character is a letter.

![A function from Char to Boolean](char_boolean.svg)

However functions in programming can also be quite different from mathematical functions - they can perform various operations that have nothing to do with returning a value, called side effects. This is because most common programming languages and paradigms were created at a times when the computer resources were much more limited than today, and programming - much more cumberstone, so people had bigger problems than the fact that their functions were not mathematically sound. Then no one bothered to make the transition.


Functional Composition 
===

Let's assume that we have two functions, **g: Y → P** and **f: P → G** and the codomain of the first one is the same set as the domain of the second.

![Matching functions](functions_matching.svg)

If we apply the first function **g** to some element from set **Y**, we will get an element of the set **P**. Then, if we apply the second function **f** to *that* element, we will get an element from type **G**

![Applying one function after another](functions_one_after_another.svg)

We can define a new function, that is the equivalent to performing the operation described above. Lets call it **h: Y → G**. We may say that **h** is the *composition* of **g** and **f**, or **h = f ∘ g** (notice that the first function is on the right, so its similar to **b = f(g(a)**).

![Functional composition](functions_compose.svg)

Composition is the essence of all things categorical. The key insight is that the sum of two parts is no more complex than the parts themselves. 

Question: The definition of functional composition (presented in the second paragraph) relies on the fact that functions are many-to-one relationships between sets. How could functional composition work for many-to-many relationships? Can it work at all?

Representing Composition with Commutative Diagrams
---

In the last diagram, the equivalence between **f ∘ g** and the new function **h** is expressed by the fact that if you follow the arrow **h** for any element of set **Y** you will get to the same element of the set **G** as the one you will get if you follow the **g** and then follow **f**. Diagrams that express such equivalence between sequences of function application are called *commutative diagrams*.

![Functional composition](functions_compose.svg)


If we "zoom-out" the last diagram so it does not show the individual set elements, we get a more general diagram for functional composition.

![Functional composition for sets](functions_compose_sets.svg)

In fact, because the diagram commutes (all arrows, starting from a given set element ultimately lead to the same corresponding element from the resulting set), ennumerating the elements is redundant. So we can, for example, redefine functional composition in the following, visual, way:

The composition of two functions **f** and **g** is a third function **h** defined in such a way that this diagram commutes.

![Functional composition - general definition](functions_compose_general.svg)

You will see more definitions like this in the future.

Isomorphisms
===

Let's go back to the function that demonstrated a one-to-one relationship:

![Opposite colors](function_one_one.svg)

Notice that the function is invertible, that is if you flip its arrows you get another valid function:

![Opposite colors](isomorphism_one_one.svg)

Invertible functions are called *isomorphisms*. When there is an invertible function between two sets we can say that the sets are *isomorphic*. For example the temperature measured in Celcius, is isomorphic to the temperature, measured in Fahrenheit.

More formally, two sets **R** and **G** are isomorphic, or **R ≅ G** if there exist functions **f: G → R** and its reverse **g R → G**, such that **f ∘ g = idR** and **g ∘ f = idG** (notice how the identity function comes in handy).

Isomorphism and equality
---

The concept of an isomorphism is strongly related to the concept of equality (that is why it is denoted with **≅**, which is almost the same as **=**). 

For example, the identity function is reversible, so each set is isomorphic to itself.

![The identity function](isomorphism_identity.svg)

Note that an isomorphism between two sets does not imply that their *elements* are similar to one another, as some of the examples might suggest. It rather implies that they have similar *structure*, so a function that involves one of the sets, can easily be converted to a function involving the other set. 

For example, if you have a function "is the husband of" that goes from the set of all married men to the set of all married women,  and the corresponding function, "is the wife of", that would make the sets of married men and married woman isomorphic (ignoring some exceptions). That is not to say that you are the same person as your significant other, but rather that every statement about you, or every relation you have to some other person or object is also a relation between him/her and the same person or object. For example my wive's father is my father-in-law. Her cat, is to me is "my wife's cat". If my wife has a red hair, I am a person who is married to a person that has red hair and so on.

Isomorphisms Between Singleton Sets
---

Between any two singleton sets, we may define the only possible function.

The function is invertible, which means that all singleton sets are isomorphic to one another.

Following the logic from the last paragraph, each statement about something that is one of a kind can be transferred to a statement about another thing that is one of a kind. 

Question: Try to come up with a good example that shows how a statement that demonstrates the isomorphism between singleton sets (I obviously couldn't). Consider that all of people and objects are sharing one and the same universe.

Task: Think of two singleton sets, and try to pinpoint the relation that they have.
