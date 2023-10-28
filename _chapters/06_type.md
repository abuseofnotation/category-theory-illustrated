layout: default
title: Types
---

In the last "category overview" chapter in the book, we will talk about, in my opinion, the most interesting category of all --- the category of **types**. 

This might be disappointing, if you expected to learn about as many *new* categories as possible (for which you don't even suspect that they are categories till the unexpected reveal), as we've been giving examples with the category of types in programming languages ever since the first chapter, so we already know that they form a category, and *how* they form it. You have also heard about the Curry-Howard correspondence, that connects types and logic, which we will be discussing in depth

However, types are not just about programming languages --- they are an alternative to sets (and categories) as the foundational language of mathematics. More so, they are as powerful tool as any of those formalisms.

Sets and types
===

Most books about category theory (and mathematics in general) begin with sets, simply because *sets are simple to understand*, at least when we are operating on the conceptual level that is customary for introductory materials --- when we draw a circle around a few things, everyone knows what we are talking about. So, it is tempting to think that we can use sets to represent everything we want. But, as we will see shortly, this view is somewhat *naive*.


Type theory and set theory are related conceptually. 


Russell's paradox
---

Type theory and set theory are also related historically, the first version of type theory was developed by Bertrand Russell in response to a paradox that he found in the first version of set theory (usually called *naive* set theory). This paradox is called "Russel's paradox.

Russel's paradox arises due to the very same characteristics of set theory that makes it so simple - the idea that everything is a set that contains other sets. The core of the paradox, is that (unlike a type), a set can contain itself.

![A set that contains itself](../06_types/set_contains_itself.svg)

Unlike the set above, most sets that we discussed (like the empty set and singleton sets) do not contain themselves. 

![Sets that don't contains themselves](../06_type/sets_dont_contain_themselves.svg)

In order to understand Russell's paradox we will try to visualize *the set of all sets that do not contain themselves*. In the original set notation we can define this set to be such that it contains all sets $x$ such that $x$ is not a member of $x$), or $\{x \mid x ∉ x \}$

![Russel's paradox - option one](../06_type/russells_paradox.svg)

If we look at the definition, we recognize that the set that we just defined does not contain itself and therefore it belongs there as well.

![Russel's paradox - option one](../06_type/russells_paradox_2.svg)

Hmm, something is not quite right with this diagram as well --- because of the new adjustments that we made, our set now *contains itself*. And removing it from the set would just bring us back to the previous situation. So, this is Russell's paradox. 

Resolving the paradox --- ZFC
---

Russel's paradox completely changed the game of set theory, as averting it requires that we impose certain restrictions to the ways in which you can define sets. i.e. we can no longer allow sets to be generated freely.


And, while doing so is possible, (the new paradox-free “version” of set theory by Zermelo and Fraenkel is still in use today) the result is not simple.



Russell himself took a different route and he developed an entirely new mathematical theory that is like set theory, but which is much more strict and rigid. But I will stop here, as we have a special chapter dedicated to types.

Resolving the paradox --- Types
---

Type theory and set theory are related in that type theory can be seen as a more restrictive version of set theory. In set theory you have only one kind of object that is (you guessed it) &mdash; set, and a set can contain anything, including other sets. In type theory, you generally have two concepts &mdash; **types** and **values** (which in a mathematical context we call **terms**). 

From set theory to type theory
---

To avert this and related paradoxes, we have to impose certain restrictions to the ways in which you can define sets. And while doing so is possible without any significant changes to the set theory's core (the new paradox-free "version" of set theory by *Zermelo and Fraenkel* is still in use today), Russell himself took a different route and he developed an entirely new mathematical theory that is *like set theory*, but which is much more strict and rigid.

The theory of types defines two primitive concepts &mdash; *types and values*, which correspond to *sets and set elements*, but at the same time differ in many respects.

Types 
---

Types contain values, so they are like sets in this respect (although this is not true for all formulations of type theory). In fact, every type can be seen as a set of its values. However, unlike sets, which can contain other sets, *a type cannot contain other types*. And so, *not every set is a type* (although the reverse is true). The proper way to think about a type is as a collection of values that *share some common characteristics*.

Values 
---

Values are like set elements, in that they constitute the contents of a type. However, while a given object can be an element of many sets, a given value *belongs to only one type* (we can also say that it *is* a given type), i.e., the type of each value is an intrinsic property of the value.

This may seem weird at first, e.g., when we create a subtype for example, as in the type-theoretic example of our constructing the set of all balls with warm colors, we end up with two instances of all objects that are members of both types, but it actually makes sense after we get used to it. After all, we can always convert the more general version of the value to the more specific one, using the function that exist between each set and its subset.

Conclusion
---

I won't get into more details, as there are many versions of type theories which are very different from one another, so examining them wouldn't be easy (e.g., if we look into programming languages, each language uses a different type system and different ways to construct subtypes.) Instead, we will return to using set theory, which in contrast has just a few formulations that are very similar to one another.


Types as mathematical foundation
====


Types and computation
===


Numbers as types
===

Learning mathematics, can feel overwhelming, because of the huge, even infinite, body of knowledge: how do you proceed so big of a task? But it turns out the answer is simple: you start off knowing 0 things, 0 theories. Then, you learn 1 theory - congrats, you have learned your first theory and so you would know a total of 1 theories. Then, you learn 1 more theory and you would already know a total of 2 theories. Then learn 1 more theory and then 1 more and, given enough time and dedication, you may learn all theories.

This little argument applies not only to learning mathematical theories, but to everything else that is "countable", so to say. This is because it is the basis of the mathematical definition of natural numbers, as famously syntesized in the 19th century by the Italian mathematician Giuseppe Peano:

1. $0$ is a natural number.
2. If $n$ is a naturan number, $n+1$ is a natural number.

And then, he gave the following laws.


Types and categories
===

In thinking of a category as a type theory, the objects of a category are
regarded as types (or sorts) and the arrows as mappings between the corresponding
types. Roughly speaking, a category may be thought of a type theory shorn of
its syntax. In the 1970s Lambek20 established that, viewed in this way, cartesian
closed categories correspond to the typed λ-calculus. Later Seely [1984] proved
that locally Cartesian closed categories correspond to Martin-L¨of, or predicative,
type theories. Lambek and Dana Scott independently observed that C-monoids,
i.e., categories with products and exponentials and a single, nonterminal object
correspond to the untyped λ-calculus. The analogy between type theories and
categories has since led to what Jacobs [1999] terms a “type-theoretic boom”,
with much input from, and applications to, computer science
