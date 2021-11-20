---
layout: default
title: Sets
---

Sets
===

Let's begin our inquiry by looking at the basic theory of sets. Set theory and category theory share many similarities. We can view category theory is a *generalization* of set theory. That is it is is meant to describe the same thing as set theory (everything?), but to do it in a more absract manner, one that is more versatile and (hopefully) simpler. 

In other words sets are an *example of a category* (the *proto-example*, we might say), and it is useful to have examples. 

What is an Abstract Theory
===

> Instead of asking what can be defined and deduced from what is assumed to begin with, we ask instead what more general ideas and principles can be found, in terms of which what was our starting-point can be defined or deduced.
> Bertrand Russell, from Introduction to Mathematical Philosophy

Most scientific and mathematical theories have a specific *domain*, to which they are tied to, and in which they are valid. They are created with this domain in mind and are not intended to be used outside of it. For example, Darwin's theory of evolution is created in order to explain how different *biological species* came to evolve using natural selection, quantum mechanics is a description of how particles behave at a specific scale etc.

Even most mathematical theories, although not inherently *bound* to a specific domain, like the scientific ones, are often strongly related to one, as differential equations are linked to how events change over time. 

Set theory and category theory are different. They are not created to provide a rigorous explanation of how a particular phenomenon works. Instead they provide a more general framework for explaining all kinds of phenomena. They work less like tools and more like languages for defining tools. Theories that are like that are called *abstract* theories. 

The borders of the two are sometimes blurry, because all theories *use abstraction*, otherwise they would be pretty useless: without abstraction Darwin would have to speak about specific animal species or even individual animals. But theories have core concept that don't refer to anything in particular, but instead are left for people to generalize on. All theories are applicable outside of their domains, but set theory and category theory do not have a domain to begin with.

Concrete theories, like the theory of evolution, are composed of concrete concepts. For example the  concept of a *population*, also called a *gene-pool*, refers to a group of individuals that can interbreed. Abstract theories, like set theory, are composed of abstract concepts, like the concept of a set. The concept for a set by itself does not refer to anything. However, we cannot say that it is empty concept, as there are countless things that can be represented by sets, like for example a gene pools can be (very aptly) represented by sets of individual animals. And species of animals can too be represented by set - a set of all populations that can theoretically interbreed.

You already see how abstract theories may be useful. Because they are so simple, they can be used as building blocks of many concrete theories. Because they are common, they can be used to unify and compare different concrete theories, by putting these theories in common grounds (this is very characteristic of category theory, as we will see later.) Moreover, good (abstract) theories can serve as *mental models* for developing our thoughts. 

<!-- comic - brain on category theory -->

<!--
People have tried to be precise and at the same time down to Earth for centuries, and only recently discovered that "precise and down to Earth" is an oxymoron. Let's take Euclidian geometry as an example. Yes, Euclidian geometry is precise, because it is valid for all sets of objects, called ("point" "line" "angle" and "circle" etc.), which have relationships, as defined by the five famous axioms. Yes, geometry does, in many instances, describe the natural world, because there are many sets of objects which have these relations. However, its "precise" part and it's "down to Earth" part have nothing to do with each other. We can, for example, define a point as any stain on the floor of your room and that a line as a piece of duct tape, put on the same floor - that will be a completely valid application of the Euclidian laws, albeit not very useful one. Or we can try to use geometry to reason about points on the surface of the Earth, which is a very useful application, of geometry, however not of Euclidian geometry, because Euclidian geometry only describes points on a flat plane, and the Earth is not flat. You can argue that these are actually two separate theories there, which just happen to be perceived as one. You have the axioms, or the postulates on one hand, which are not useful for anything on their own, and you have applications in science and engineering which are somewhat based on them, but not quite. 
-->

Sets
===

Perhaps unsurprisingly, everything in set theory is defined in terms of sets. A set is an collection of things where the "things" can be anything you want (like individuals, populations, genes etc.) Consider, for example, these balls.

![Balls](elements.svg)

Let's construct a set, call it \\(G\\) (as gray) that contains *all* of them as elements. There can only be one such set: Because a set has no structure (there is not order, no ball goes before or after another, there are no members which are "special" with respect to their membership of the set) two sets that contain the same elements are just two pictures of the same set.

![The set of all balls](all.svg)

This example may look overly-simple but in fact it is just as valid as any other one. 

The key insight that makes the concept useful is the fact that it enables you to reason about several things as if they were one.
 
Subsets 
---

Let's construct one more set. The set of *all balls that are warm color*. Let's call it \\(Y\\) (because in the diagram is colored in **y**ellow.)

![The set of all balls of warm colors](subset.svg)

Notice that \\(Y\\) contains only elements that are also present in \\(G\\). That is, every element of the set of \\(Y\\) is also an element in the set \\(G\\). When two sets have this relation, we may say that \\(Y\\) is a *subset* of \\(G\\) (or \\(Y \subseteq G \\) ). A subset resides completely inside its superset When the two are drawn together.

![Y and G together](set_subset.svg)

Singleton Sets
---

The set of all *red balls* contains just one ball. We said above that sets summarize *several* elements into one. Still, sets that contain just one element are perfectly valid - simply put, there are things that are *one of a kind*. The set of queens of England is a singleton set. The set of books written by the American writer Harper Lee and published during her lifetime is a singleton set.

![The singleton set of red balls](singleton.svg)

What's the point of the singleton set? Well, it is part of the language of set theory e.g. if we have a function which expects a set of given items, but  if there is only one item that meets the criteria, we can just create a singleton set with that item.

The Empty set
---

Of course if one is a valid answer, so can be zero. If we want a set of all *black balls*  \\(B\\) or all the *white balls*, \\(W\\), the answer to all these questions is the same - the empty set. Or in other words.

![The empty set](void.svg)

Note that a set is defined only by the items it contains, which means that there is no difference between the set that contains zero *balls* and the set that contains zero *numbers*, for instance. In other words, the empty set is *unique* set, which makes it a very special one. Formally, the empty set is marked with the symbol \\(\varnothing\\) (so \\(B = W = \varnothing\\)).

The empty set is a special one, for example, it is a subset of every other set or mathematically speaking, \\(\forall A  \to \varnothing \subseteq A\\)) (\\(\forall\\) means "for all")

Functions
===

> By function I mean the unity of the act of arranging various representations under one common representation.
> Immanuel Kant, from Critique of Pure Reason

A function is a relationship between two sets that matches each element of one set, called the *source set* of the function, with exactly one element from another set, called the **target set** of the function. 

These two sets are also called the *domain* and *codomain* of the function, or its *input* and *output*.  In programming, they go by the name of *argument type* and *return type*. In logic, they correspond to the *premise* and *conclusion* (we will get there.) We might also say, depending on the situation, that a given function *goes* from this set to that other one, *connects* this set to the other, or that it *converts* a value from of this set to one of the the other one. These different terms demonstrate the multifaceted nature of the concept of function.

Here is a function, \\(f\\) which converts each ball from the set \\(R\\) to the ball with the opposite colour in another set \\(G\\) (in mathematics a function's name is often accompanied by the names of its source and target sets, like this: \\(f: R → G\\))

![Opposite colors](function_one_one.svg)

This is probably one of the simpler types of functions there exists. That is because it encodes a *one-to-one relationship* between the sets - *one* element from the source is connected to exactly *one* element from the target (and the other way around).

But functions can also express relationships of the type *many-to-one*, where *many* elements from the source might be connected to *one* element from the target (but not the other way around). For example, a function can express a relationship in which several elements from the source set relate to the same element of the target set.

![Function from a bigger set to a smaller one](function_big_small.svg)

It can also express relationships in which some elements from the target set do not play a part.

![Function from a smaller set to a bigger one](function_small_big.svg)

One thing that you cannot have is a source element which is not mapped to anything, or which is mapped to more than one target element. That would mean the relationship expressed by the function will be *many-to-many*, and, as we said in the beginning, functions are many-to-one relationships. There is a reason for that "design decision", and we will arrive at it shortly.

Sets and functions can express relationships between all kinds of objects, and even people. Every question that you ask can most probably be expressed as a function.

The question "How far are we from New York?" is a function with set of all places in the world as source set and an target set consisting of the set of all positive numbers.

**Question:** Some people might say that the target of this function is bigger than it should be. How would you refine it?

The question "Who is my father?" is a function whose source is the set of all people in the world.

**Question:** What is the target of this function?

Note that the question "Who is my child?" is *NOT* a straightforward function, because a person can have no children, or can have multiple children. We will learn to represent such questions as functions later.

**Question:** Do all functions that we drew at the beginning *express* something? Do you think that a function should express something in order to be valid? 

The Identity Function
---

For every set **G**, no matter what it represents, we can define the function that does nothing, or in other words, a function which maps every element G to itself. It is called the *the identity function* of **G** or **id G: G → G**.

![The identity function](function_identity.svg)

You can think of **id G** as a function which represents the set **G** in the realm of functions. Its existence allows us to prove many theorems, that we "know" by intuition, formally.

Functions and Subsets
---

For each set and subset, no matter what they represent, we can define the function that maps each element of the subset to itself:

![Function from a smaller set to a bigger one](function_small_big.svg)

Every set is a subset of itself, in which case this function is the same as the identity.

Functions and the Empty Set
---

There is a unique function from the empty set to any other set.

![Function with empty set](function_empty.svg)

**Question:** Is this really valid? Why? Check the definition.

Note that this statement is also a result from the one saying that there is a function between a Subset and a Set, and the one that says that the empty set is a subset of any other set.

**Question:** What about the other way around. Are there functions with the empty set as an target as opposed to its source?

Functions and Singleton Sets
---

There is a unique function from any set to any singleton set.

![Function with a singleton set](function_singleton.svg)

**Question:** Is this really the only way to connect *any* set to a singleton set in a valid way?

**Question:** Again, what about the other way around?

Sets and Functions 
===

Many things can be expressed as sets and functions, let's examine some of them.


Sets and Functions in Numbers
---

All mathematical operations can be expressed as functions, acting on the set of numbers. Actually there are several such sets, such the set of positive whole numbers, (also called "natural" numbers), **N := {1, 2, 3... ∞}**, the set of both positive and negative whole numbers **Z := {-∞... -3 -2, -1, 0, 1, 2, 3... ∞}**. And the set of "Real" numbers which include all numbers that I know of.

For example, squaring a number is a function from the set of real numbers to the set of real positive numbers (because both sets are infinite, we cannot draw them in their entirety, however we can draw a part of them).

![The square function](square.svg)

I will use the occasion to reiterate some of the more important characteristics of functions:

- All numbers from the target have (or should have) two arrows pointing at them (one for the positive square root and one for the negative one), and that is OK. 

- Zero from the source set is connected to itself in the target set - that is permitted.
- Some numbers aren't the square of any other number - that is also permitted.

Overall everything is permitted, as long as you can always provide exactly one result (also known as *The result™*) per value, and in mathematics almost always do. Actually, math is designed in a way so its operations are valid functions:

> Every generalization of number has first presented itself as needed for some simple problem: negative numbers were needed in order that subtraction might be always possible, since otherwise a − b would be meaningless if a were less than b; fractions were needed in order that division might be always possible; and complex numbers are needed in order that extraction of roots and solution of equations may be always possible.
> Bertrand Russell, from Introduction to Mathematical Philosophy

Note that most mathematical operations, such as addition, multiplication etc. require two numbers in order to produce a result. This does not mean that they are not functions, it means that they are just a little more fancy ones. Depending on what we need, we may present those operations as functions from the sets of *tuples* of numbers to the set of numbers, or we may say that they take a number and return a function. More on that later.

Sets and Functions in Programming
---

Sets are used extensively in programming, especially in their incarnation as *types* (or also *classes*). All sets of numbers that we discussed earlier also exist in most languages as types, and there are also some non-mathematical types that play a huge role in programming.

The simplest type, `Boolean` is nothing more than a set of two values - `true` and `false`:

![Set of boolean values](boolean.svg)

Another very basic set in programming is the set of keyboard characters, or `Char`: 

![Set of characters](char.svg)

Characters are actually used rarely by themselves and mostly as parts of sequences.

Most of the types of programming are composite types - they are a combination of the primitive types that are listed here. Again, we will cover these later.

**Question:** What is the type equivalent of subsets in programming?

**Question:** Do you recognize some of the basic functions we defined in programming languages you know?

Some functions in programming (also called methods, subroutines, etc.) kinda resemble mathematical functions - they sometimes take one value of a given type (or in other words, an element that belongs to a given set) and always return exactly one element which belongs to another type (or set). For example here is a function which that takes an argument of type `Char` and returns a `Boolean`, depending on whether the character is a letter.

![A function from Char to Boolean](char_boolean.svg)

However functions in programming can also be quite different from mathematical functions - they can perform various operations that have nothing to do with returning a value, called side effects. This is because most common programming languages and paradigms which are in use today were created at times when the computer resources were much more limited than today, and programming - much more cumbersome, so people had bigger problems than the fact that their functions were not mathematically sound. 

One type of functions used in programming which strongly resembles mathematical ones are those which convert a value from one type to another, for example, the function which converts a floating-point number to an Integer. That is probably the reason why most functional languages are strongly-typed.

Sets and Types
---

The concepts of types and sets are related. The concept of sets is simpler - in set theory you have only one kind of object that is (you guessed it) - set and a set can contain anything, including other sets. In type theory, you have two concepts - types and values. Types are like sets, in fact every type can be represented as a set of its values, but *not every set is a type*. Usually, the proper way to think about type is as a collection of values that *share common characteristics*. The definitions tend to vary between different type theories (of which there are a lot), but mostly go along the lines of:

- A type cannot contain other types, just values. 
- value can be a member of only one type (there exist the concept of are subtypes, just as there are subsets, but again things are more strict).

{% if site.distribution == 'print'%}

Russell's Paradox
---

The first type theory was developed by Bertrand Russell in response to a paradox in the original set theory, arising due to the fact that, unlike types (which can only contain *values*), sets can contain other sets. 

In particular, a set can contain itself.

![A set that contains itself](set_contains_itself.svg)

Unlike the set above, most sets that we discussed (like the empty set and singleton sets) do not contain themselves. 

![Sets that don't contains themselves](sets_dont_contain_themselves.svg)

In order to understand Russell's paradox we will try to visualize **the set all sets that do not contain themselves**. In the original set notation we can define this set as *Let R = { x => x ∉ x }* (let R be such that it contains all sets *x* such that *x* is not a member of *x*). 

![Russel's paradox - option one](russells_paradox.svg)

If we look at the definition, we recognize that the set that we just defined - *R* does not contain itself and therefore it belongs there as well.

![Russel's paradox - option one](russells_paradox_2.svg)

Hm, something is not quite right with this diagram as well - Because of the new adjustments that we made *R* **contains itself**. And removing it from the set would just bring us back to the previous situation. This is Russell's paradox. There are, of course, multiple theories that it does not apply to.

{%endif%}

Functional Composition 
===

Let's assume that we have two functions, **g: Y → P** and **f: P → G** and the target of the first one is the same set as the source set of the second one.

![Matching functions](functions_matching.svg)

If we apply the first function **g** to some element from set **Y**, we will get an element of the set **P**. Then, if we apply the second function **f** to *that* element, we will get an element from type **G**.

![Applying one function after another](functions_one_after_another.svg)

We can define a new function, that is the equivalent to performing the operation described above. Let us call it **h: Y → G**. We may say that **h** is the *composition* of **g** and **f**, or **h = f ∘ g** (notice that the first function is on the right, so it's similar to **b = f(g(a)**).

![Functional composition](functions_compose.svg)

Composition is the essence of all things categorical. The key insight is that the sum of two parts is no more complex than the parts themselves. 

**Question:** The definition of functional composition (presented in the second paragraph) relies on the fact that functions are many-to-one relationships between sets. How could functional composition work for many-to-many relationships? Can it work at all?

Representing Composition with Commutative Diagrams
---

In the last diagram, the equivalence between **f ∘ g** and the new function **h** is expressed by the fact that if you follow the arrow **h** for any element of set **Y** you will get to the same element of the set **G** as the one you will get if you follow the **g** and then follow **f**. Diagrams that express such equivalence between sequences of function application are called *commutative diagrams*.

![Functional composition](functions_compose.svg)


If we "zoom-out" the last diagram so it does not show the individual set elements, we get a more general view of functional composition.

![Functional composition for sets](functions_compose_sets.svg)

In fact, because this diagram commutes (that is, all arrows, starting from a given set element ultimately lead to the same corresponding element from the resulting set), enumerating the elements is redundant. Having this insight allows us to redefine functional composition in the following, more visual, way:

The composition of two functions **f** and **g** is a third function **h** defined in such a way that this diagram commutes.

![Functional composition - general definition](functions_compose_general.svg)

This is called an *external diagram*, by the way (and the ones that we saw before are internal).

The Power of Composition
---

To understand how powerful composition is, consider the following: one set being connected to another means that each function from the second set can be transferred to a corresponding function from the first one.

If we have a function **g: P → Y** from set **P** to set **Y**, then for every function **f** from the set **Y** to any other set, there is a corresponding function **f ∘ g** from the set **P** to the same set. In other words, every time you define a new function from **Y** to some other set, you gain one function from **P** to that same set for free.

![Functional composition connect](morphism_general.svg)

For example, if we again take the relationship between a person and his father as a function, with the set of all people in the world as source, and the set of all people that have children as its target, then each person whom my father is related to is automatically my relative - my father's father is my grandfather, my father's wife is my mother and so on.  

Isomorphisms
===

Let's go back to the function that demonstrated a one-to-one relationship.

![Opposite colors](function_one_one.svg)

Notice that the function is invertible, that is if you flip its arrows you get another valid function:

![Opposite colors](isomorphism_one_one.svg)

Invertible functions are called *isomorphisms*. When there is an invertible function between two sets we can say that the sets are *isomorphic*. For example, the temperature measured in Celsius is isomorphic to the temperature, measured in Fahrenheit.

More formally, two sets **R** and **G** are isomorphic, or **R ≅ G** if there exist functions **f: G → R** and its reverse **g: R → G**, such that **f ∘ g = id R** and **g ∘ f = id G** (notice how the identity function comes in handy).

Isomorphism and equality
---

In category theory, the concept of an isomorphism is strongly related to the concept of equality (that is why it is denoted with **≅**, which is almost the same as **=**). This is also related to programming, where if we have a function that convert our object of type A to an object of type B and the other way around we pretty much regard A and B as two formats of the same object.

For example, we all know that everything is equal to itself. Well, if you look closely you would see that the identity function is reversible (its reverse is itself), so each set is also isomorphic to itself.

![The identity function](isomorphism_identity.svg)

Note that an isomorphism between two sets does not imply that their *elements* are similar to one another, as some of the examples might suggest. It rather implies that they have similar *structure*, in other words, a function that involves one of the sets, can easily be converted to a function involving the other set. 

![The architecture of isomorphism](isomorphism_general.svg)

For example, if you have a function "is the husband of" that goes from the set of all married men to the set of all married women,  and the corresponding function, "is the wife of", that would make the sets of married men and married woman isomorphic (ignoring some exceptions). That is not to say that you are the same person as your significant other, but rather that every statement about you, or every relation you have to some other person or object is also a relation between him/her and the same person or object, and vice versa. 

Isomorphisms Between Singleton Sets
---

Between any two singleton sets, we may define the only possible function.

![The only possible function between singletons](singleton_function.svg)

The function is invertible, which means that all singleton sets are isomorphic to one another.

![Isomorphic singletons](singleton_isomorphism.svg)

Following the logic from the last paragraph, each statement about something that is one of a kind can be transferred to a statement about another thing that is one of a kind. 

*Question:* Try to come up with a good example that shows how a statement that demonstrates the isomorphism between singleton sets (I obviously couldn't). Consider that all of people and objects are sharing one and the same universe.

**Task:** Think of two singleton sets, and try to pinpoint the relation that they have.

