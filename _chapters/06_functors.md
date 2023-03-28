---
layout: default
title: Functors
---



Functors 
===

From this chapter on, we will change the tactic a bit (as I am sure you are tired of jumping through different subjects) and we will dive at full throttle into the world of categories, using the structures that we saw so far as context. This will allow us to generalize some of the concepts that we examined in these structures and thus make them valid for all categories. 

Categories we saw so far
===

So far, we saw many different categories and category types. Let's review them once more:

The category of sets
---

We began by reviewing the mother of all categories - *the category of sets*.

![The category of sets](../06_functors/category_sets.svg)

We also saw that it contains within itself many other categories, such as the category of types in programming languages.

Special types of categories 
---

We also learned about other algebraic objects that turned out to be just *special types of categories*, like categories that have just one *object* (monoids, groups) and categories that have only one *morphism* between any two objects (preorders, partial orders).

![Types of categories](../06_functors/category_types.svg)

Other categories
---

We also defined a lot of *categories based on different concepts*, like the ones based on logics/programming languages, but also some "less-serious ones", as for example the color-mixing partial order/category.

![Category of colors](../06_functors/category_color_mixing.svg)

Finite categories
---

And most importantly, we saw some categories that are *completely made up*, such as my soccer player hierarchy. Those are formally called *finite categories*. 

![Finite categories](../06_functors/finite_categories.svg)

Although they are not useful by themselves, the idea behind them is important - we can draw any combination of points and arrows and call it a category, in the same way that we can construct a set out of every combination of objects. 

Examining some finite categories
---

For future reference, let's see some important finite categories. 

The simplest category is $0$ (enjoy the minimalism of this diagram).

![The finite category 0](../06_functors/finite_zero.svg)

The next simplest category is $1$ - it is comprised of one object no morphism besides its identity morphism (which we don't draw, as usual)

![the finite category 1](../06_functors/finite_one.svg)

If we increment the number of objects to two, we see a couple of more interesting categories, like for example the category $2$ containing two objects and one morphism.

![the finite category 2](../06_functors/finite_two.svg)

**Task:** There are just two more categories that have 2 objects and at most one morphism between two objects, draw them.

And finally the category $3$ has 3 objects and also 3 morphisms (one of which is the composition of the other two).

![the finite category 3](../06_functors/finite_three.svg)

Categorical isomorphisms
===

Many of the categories that we saw are similar to one another, as for example, both the color-mixing order and categories that represent logic have a *greatest* and a *least* object. To pinpoint such similarities, and understand what they mean, it is useful to have formal ways to connect categories with one another. The simplest type of such connection is the good old isomorphism.

Set isomorphisms
---

In chapter 1 we talked about *set isomorphisms*, which establish an equivalence between two sets. In case you have forgotten, a set isomorphism is a *two-way function* between two sets. 

![Set isomorphism](../06_functors/set_isomorphism.svg)

It can alternatively be viewed as two "twin" functions such that each of which equals identity, when composed with the other one. 


Order isomorphisms
---

Then, in chapter 4, we encountered *order isomorphisms* and we saw that they are like set isomorphisms, but with one extra condition - aside from just being there, the functions that define the isomorphism have to preserve the order of the object e.g. the greatest object of one order should be connected to the greatest object of the other one, the least object of one order should be connected to the least object of the other one, and same for all objects that are in between. 

![Order isomorphism](../06_functors/order_isomorphism.svg)

Or more formally put, for any $a$ and $b$ if we have $a ≤ b$ we should also have $F(a) ≤ F(b)$ (and vise versa).

Categorical isomorphisms
---

Now, we will generalize the definition of an order isomorphism, so it also applies to all other categories (i.e. to categories that may have more than one morphism between two objects): 

> Given two categories, an isomorphism between them is an invertible mapping between the underlying sets of objects, *and* an invertible mapping between the morphisms that connect them, which maps each morphism from one category to a morphism *with the same signature*.

![Category isomorphism](../06_functors/category_isomorphism.svg)

After examining this definition closely, we realize that, although it *sounds* a bit more complex (and *looks* a bit messier) than the one we have for orders *it is actually the same thing*. It is just that the so-called "morphism mapping" between categories that have just one morphism for any two objects are trivial, and so we can omit them.

![Order isomorphism](../06_functors/category_order_isomorphism_2.svg)

**Question:** What are the morphism functions for orders?

<!--
We always map the single morphism of the source category to the single morphism of the target category (which is guaranteed to exist, due to the *order-preserving* condition)
-->

However, when we can have more than one morphism between two given objects, we need to make sure that each morphism in the source category has a corresponding morphism in the target one, and for this reason we need not only a mapping between the categories' objects, but one between their morphisms.

![Category isomorphism](../06_functors/category_order_isomorphism.svg)

By the way, what we just did (taking a concept that is defined for a more narrow structure (orders) and redefining it for a more broad one (categories)) is called *generalizing* of the concept.

The problem with categorical isomorphisms
---

By examining them more closely, we realize that categorical isomorphisms are not so hard to define. However there is another issue with them, namely that they *don't capture the essence of what categorical equality should be*. I have devised a very good and intuitive explanation why is it the case, that this ~~margin~~ section is to narrow to contain.

In the next chapter we will devise a more apt way to define a *two-way connection* between categories. But for this, we need to first examine *one-way connections* between them, i.e. *functors*.

PS: Categorical isomorphisms are also *very rare in practice* - the only one that comes to mind me is the Curry-Howard-Lambek isomorphism from the previous chapter. That's because if two categories are isomorphic then there is no reason at all to treat them as different categories - they are one and the same. 

<!--
comics:
OK, I think I got it - isomorphisms are when you have two similar pictures and you connect the dots.

Pretty much.
-->

What are functors
===

The logician Rudolf Carnap coined the term "functor" as part of his project to formalize the syntax for the natural languages such as English in order to create a precise way for us to talk about science. Originally, a functor meant a word or phrase whose meaning can be customized by combining it with numerical value, such as the phrase "the temperature at $x$ o'clock", which has a different meaning depending on the value of $x$.

In other words, a functor is a phrase that *acts as a function*, only not a function between sets, but one between *linguistic concepts* (such as times and temperature).

![Functor, as envisioned by Rudolf Carnap.](../06_functors/functor_carnap.svg)

Later, one of the inventors of category theory Sanders Mac Lane borrowed the word, to describe a something that *acts as function between categories*, which he defined in the following way:

> A functor between two categories (let's call them $A$ and $B$) consists of two mappings - a mapping that maps each *object* in $A$ to an object in $B$ and a mapping that maps each *morphism* between any objects in $A$ to a morphism between objects in $B$, in a way that *preserves the structure* of the category. 

![Functor](../06_functors/functor.svg)

Now let's unpack this definition by going through each of its components.

Object mapping
---

In the definition above we use the word "mapping" to avoid misusing the word "function" for something that isn't exactly a function. But in this particular case, calling the mapping a function would barely be a misuse - if we forget about morphisms and treat the source and target categories as sets, the object mapping is nothing but a regular old function.

![Functor for objects](../06_functors/functor_objects.svg)

A more formal definition of object mapping involves the concept of an *underlying set* of a category: Given a category $A$, the underlying set of $A$ is a set that has the objects of $A$ as elements. Utilizing this concept, we say that the object mapping of a functor between two categories is *a function between their underlying sets*. The definition of a function is still the same:

> A function is a relationship between two sets that matches each element of one set, called the *source set* of the function, with exactly one element from another set, called the *target set* of the function. 

Morphism mapping
---

The second mapping that forms the functor is a mapping between the categories' morphisms. This mapping resembles a function as well, but with the added requirement that each morphism in $A$ a given source and target must be mapped to a morphism with the corresponding source and target in $B$, as per the object mapping.

![Functor for morphisms](../06_functors/functor_morphisms.svg)

A more formal definition of a morphism mapping involves the concept of the *homomorphism set*: this is a set that contains all morphisms that go between given two objects in a given category. When utilizing this concept, we say that a mapping between the morphisms of two categories consists of a *set of functions between their respective homomorphism sets*.

![Functor for morphisms](../06_functors/functor_morphisms_formal.svg)

Note how the concepts of *homomorphism set* and of *underlying set* allowed us to "escape" to set theory when defining categorical concepts and define everything using functions.

Functor laws
---

So these are the two mappings (one between objects and one between morphisms) that constitute a functor. But not every pair of such two mappings is a functor. As we said, in addition to existing, the mappings should *preserve the structure* of the source category into the target category. To see what that means, we revisit the definition of a category from chapter 2:

> A category is a collection of *objects* (we can think of them as points) and *morphisms* (arrows) that go from one object to another, where:
> 1. Each object has to have the identity morphism.
> 2. There should be a way to compose two morphisms with an appropriate type signature into a third one, in a way that is associative.

So this definition translates to the following two *functor laws*

1. Functions between morphisms should *preserve identities* i.e. all identity morphisms should be mapped to other identity morphisms.
 ![Functor](../06_functors/functor_laws_identity.svg)

2. Functors should also *preserve composition* i.e. for any two morphisms $f$ and $g$, the morphism that corresponds to their composition $F(g•f)$ in the source category should be mapped to the morphism that corresponds to the composition of their counterparts in the target directory, so $F(g•f) = F(g)•F(f)$.

 ![Functor](../06_functors/functor_laws_composition.svg)

And these laws conclude the definition of functors - a simple but, as we will see shortly, very powerful concept. 

To see *why* is it so powerful, let's check some examples. 

Diagrams are functors
---

> “A sign is something by knowing which we know something more.” — Charles Sanders Peirce

We will start with an example of a functor that is very *meta* - the diagrams/illustrations in this book.

You might have noticed that diagrams play a special role in category theory - while in other disciplines their function is merely complementary i.e. they only show what is already defined in another way, here *the diagrams themselves serve as definitions*. 

For example, in chapter 1 we presented the following definition of functional composition.

> The composition of two functions $f$ and $g$ is a third function $h$ defined in such a way that this diagram commutes.

![Functional composition - general definition](../06_functors/functions_compose_general.svg)

We all see the benefit of defining stuff by means of diagrams as opposed to writing lengthy definitions like

> "Suppose you have three objects $a$, $b$ and $c$ and two morphisms $f: b \to c$ and $g: a \to b$..."

However, it (defining stuff by means of diagrams) presents a problem - definitions in mathematics are supposed to be formal, so if we want to use diagrams as definitions we must first *formalize the definition of a diagram itself*. 

So how can we do that? One key observation is that diagrams look as finite categories, as, for example, the above definition looks in the same way as the category $3$.

![the finite category 3](../06_functors/finite_three.svg)

However, this is only part of the story as finite categories are just structures, whereas diagrams are *signs*. They are "something by knowing which we know something more.", as Peirce famously put it (or "...which can be used in order to tell a lie", in the words of Umberto Eco). 

For this reason, aside from a finite category that encodes the diagram's structure, the definition of a diagram must also include a way for "interpreting" this category in some other context i.e. they must include *functors*.

![diagram as a functor](../06_functors/diagram_functor.svg)

This is how the concept of functors allows us to formalize the notion of diagrams: 

> A *diagram* is comprised of one finite category (called an *index category*) and a functor from it to some other category.

If you know about semiotics, you may view the source and target categories of the functor as *signifier* and *signified*.

And so, you can already see that the concept of a functor plays a very important role in category theory. Because of it, diagrams in category theory can be *specified formally* i.e. they are categorical objects *per se*. 

You might even say that they are categorical objects *par excellance* (TODO: remove that last joke).

<!--
(TODO: By the way, the fact that a diagram commutes means just that the morphism in the finite category are sometimes composites of one another).
-->

Maps are functors
---

> A map is not the territory it represents, but, if correct, it has a similar structure to the territory, which accounts for its usefulness. Alfred Korzybski

Functors are sometimes called "maps" for a good reason - maps, like all other diagrams, are functors. If we consider some space, containing cities and roads that we travel by, as a category, in which the cities are objects and roads between them are morphisms, then a road map can be viewed as category that represent some region of that space, together with a functor that maps the objects in the map to real-world objects.

![A map and a preorder of city pathways](../06_functors/preorder_map_functor.svg)

In maps, morphisms that are a result of composition are often not displayed, but we use them all the time - they are called *routes*. And the law of preserving composition tells us that every route that we create on a map corresponds to a real-world route. 

![A map and a preorder of city pathways](../06_functors/preorder_map_functor_route.svg)

Notice that in order to be a functor, a map does not have to list *all* roads that exist in real life, and *all* traveling options ("the map is not the territory"), the only requirement is that *the roads that it lists should be actual* - this is a characteristic shared by all many-to-one relationships (i.e. functions).

Human perception is functorial 
---

We saw that, aside from being a category-theoretic concept, functors are connected to disciplines that study the human mind, like logic, linguistics, semiotics and the like. Why is it so? Recently, I wrote a [blog post about using logic to model real-life thinking](/logic-thought)) where I tackle the "unreasonable effectiveness" of functors (and "maps" in general), where I argue that is because human perception, human thinking, is functorial, that perception is just a series of functors.

My thesis is that to perceive the world around us, we are going through a bunch of functors that go from more raw "low-level" mental models to more abstract "high-level" ones. For example, our brain creates a functor between the category of raw sensory data that we receive from our senses, to a category containing some basic model of how the world works (one that tells us where are we in space, how many objects are we seeing etc.). Then we are connecting this model to another, more abstract model, which provides us with a higher-level view of the situation that we are in, and so on.

![Perception is functorial](../06_functors/chain.svg)

You can view this as a progression from simpler to more abstract from categories with less morphisms to categories with more morphisms - we start with the category of pieces of sensory data that have no connections between one another, and proceed to another category where some of these pieces of data are connected. Then, we transfer this structure in another category with even more connections.

![Perception is functorial](../06_functors/logic_thought.svg)

All this is, of course, just a speculation, but we might convince yourself that there is some basis for it, especially after we see how significant functors are for the mathematical structures that we saw before.

Functors in monoids
===

So, after this slight detour, we will return to our usual modus operandi: 

Hey, do you know that in group theory, there is this cool thing called *group homomorphism* (or *monoid homomorphism* when we are talking about monoids) - it is a function between the groups' underlying sets which preserves the group operation.

So, for example, If the time of the day right now is 00:00 o'clock (or 12 PM) then what would the time be after $n$ hours? The answer to this question can be expressed as a function with the set of integers as source and target.

![Group homomorphism as a function](../06_functors/group_homomorphism_function.svg)

This function is interesting - it preserves the operation of (modular) addition: if, 13 hours from now the time will be 1 o'clock and if 14 hours from now it will be 2 o'clock, then the time after (13 + 14) hours will be (1 + 2) o'clock. 

![Group homomorphism](../06_functors/group_homomorphism.svg)

Or to put it formally, if we call it (the function) $F$, then we have the following equation - $F(a + b) = F(a) + F(b)$ (where $+$ in the right-hand side of the equation means modular addition). Because this equation holds, the $F$ function is a *group homomorphism* between the group of integers under addition and the group of modulo arithmetic with base 11 under modular addition (where you can replace 11 with any other number).


The groups don't have to be so similar for there to be a homomorphism between them. Take, for example, the function that maps any number $n$ to 2 to the *power of $n$,* so  $n \to 2ⁿ$ (here, again, you can replace 2 with any other number). This function gives a rise to a group homomorphism between the group of integers under addition and the integers under multiplication, or $F(a + b) = F(a) \times F(b)$.

![Group homomorphism between different groups](../06_functors/group_homomorphism_addition_multiplication.svg)

Wait, what were we talking about, again? Oh yeah - group homomorphisms are functors. To see why, we switch to the category-theoretic representation of groups and revisit our first example and (to make the diagram simpler, we use $mod2$ instead of $mod11$).

![Group homomorphism as a functor](../06_functors/group_homomorphism_functor.svg)

It seems that when we view groups/monoid as one-object categories, a group/monoid homomorphism is just a functor between these categories. Let's see if that is the case.

Object mapping
---

Groups/monoids have just one object when viewed as categories, so there is also only one possible object mapping between any couple of groups/monoids - one that maps the (one and only) object of the source group to the object of the target group (not depicted in the diagram).

Morphism mapping
---

Because of the above, the morphism mapping is the only relevant component of the group homomorphism. In the category-theoretic perspective, group objects (like $1$ and $2$ $3$ etc.) correspond to morphisms (like $+1$, $+2$ $+3$ etc.) and so the morphism mapping is just mapping between the group's objects, as we can see in the diagram.


Functor laws
---

The first functor law trivial, it just says that the one and only identity object of the source group (which corresponds to the identity morphism of its one and only object) should be mapped to the one and only identity object of the target group. 

And if we remember that the group operation of combining two objects corresponds to *functional composition* if we view groups as categories, we realize that the group homomorphism equation $F(a + b) = F(a) \times F(b)$ is just a formulation of the second functor law: $F(g•f) = F(g)•F(f)$.

And many algebraic operations satisfy this equation, for example the functor law for the group homomorphism between $n \to 2ⁿ$ is just the famous algebraic rule, stating that $gᵃ gᵇ= gᵃ⁺ᵇ$.

**Task:** Although it's trivial, we didn't prove that the first functor law (the one about the preservation of identities always holds. Interestingly enough, for groups/monoids it actually follows from the second law. Try to prove that. Start with the definition of the identity function.

Functors in orders
===

And now let's talk about a concept that is completely unrelated to functors, nudge-nudge (hey, bad jokes are better than no jokes at all, right?) In the theory of orders, we have the concept of functions between orders (which is unsurprising, given that orders, like monoids/groups, are based on sets) and one very interesting type of such function, which has applications in calculus and analysis, is a *monotonic function* (also called *monotone map*) - this is a function between two orders that *preserves the order of the objects in the source order, in the target order. So a function $F$ is monotonic  when for every $a$ and $b$ in the source order, if $a ≤ b$ then $F(a) ≤ F(b)$.

For example, the function that maps the current time to the distance traveled by some object is monotonic because the distance traveled increases (or stays the same) as time increases.

![A monotonic function](../06_functors/monotone_map.svg)

If we plot this or any other monotonic function on a line graph, we see that it goes just one direction (i.e. just up or just down).

![A monotonic function, represented as a line-graph](../06_functors/monotone_map_plot.svg)

Now we are about to prove that monotonic functions are functors too, ready?

Object mapping
---

Like with categories, the object mapping of an order is represented by a function between the orders' underlying sets. 

Morphism mapping
---

With monoids, the object mapping component of functors was trivial. Here is the reverse - the morphism mapping is trivial - given a morphism between two objects from the source order, we map that morphism to the morphism between their corresponding objects in the target order. The fact that the monotonic function respects the order of the elements, ensures that the latter morphism exists.

Functor laws
---

It is not hard to see that monotone maps obey the first functor law as identities are the only morphisms that go between a given object and itself. 

And the second law ($F(g•f) = F(g)•F(f)$) also follows trivially: both morphisms $F(g•f)$ and $F(g)•F(f)$ have the same type signature. But because in orders there can be just one morphism with a given type signature, these two morphisms must be equal to one another.

**Task:** Expand the proof.

<!--
And the second law ($F(g•f) = F(g)•F(f)) also follows from the fact that there is only one morphism with a given signature. 

Suppose that in the source order we have two morphisms with the following type signature:

$f :: a \to b$ and $g :: b \to c$. 

Then, if we compose those two morphisms in the target order ($F(g)•F(f)$), we get a morphism from object $F(a)$ to object $F(c)$ ($F(g)•F(f) :: F(a) \to F(c)$).

If we compose the two morphisms in the source order, and we use the functor to get the corresponding morphism in the target order ($F(g•f)$) we get another morphism from object $F(a)$ to object $F(c)$ ($F(g•f) :: F(a) \to F(c)$)

But because in orders there can be just one morphism between $F(a)$ and $F(c)$ so these two morphisms must be equal to one another.
 
-->

Linear functions
===

OK, enough with this abstract nonsense, let's talk about "normal" functions - ones between numbers. 

In calculus, there is this concept of *linear functions* (also called "degree one polynomials") that are sometimes defined as functions of the form $f(x) = xa$ i.e. ones that contain no operations other than multiplying the argument by some constant (designated as $a$ in the example). 

But if we start plotting some such functions we will realize that there is another way to describe them - their graphs are always comprised of straight lines.

![Linear functions](../06_functors/linear_functions.svg)

**Question:** Why is that?

Another interesting property of these functions is that most of them *preserve* addition, that is for any $x$ and $y$, you have $f(x) + f(y) = f(x + y)$. We already know that this equation is equivalent to the second functor law. So linear functions are just *functors between the group of natural numbers under addition and itself.* As we will see later, they are example of functors in the *category of vector spaces*.

![Linear functions](../06_functors/linear_function_functor.svg)

**Question:** Are the two formulas we presented to define linear functions completely equivalent?

<!--
Let 
$f(x) = ax $

and 

$f(y) = ay $

Then

$f(x) + f(y) = ax + ay $

This means that

$f(x) + f(y) = a(x + y)$

but $f(x) = ax$, so 

$f(x) + f(y) = f(x + y)$
-->

And if we view that natural numbers as an order, linear functions are also functors as well, as all functions that are plotted with straight lines are obviously monotonic.

Note, however, that not all functions that are plotted straight lines preserve addition - functions of the form $f(x) = x * a + b$ in which $b$ is non-zero, are also straight lines (and are also called linear) but they don't preserve addition.

![Linear functions](../06_functors/linear_function_non_functor.svg)

For those, the above formula looks like this: $f(x) + b + f(y) + b = f(x + y) + b$.

<!--

The category of topological spaces
---
The smoothness of the mapping means that paths may stretch or collapse but not break. 
-->


Functors in programming. The list functor
===

Types in programming language form a category, associated to that category are some functors that programmers use every day, such as the list functor, that we will use as an example. The list functor is an example of a functor that maps from the realm of simple (primitive) types and functions to the realm of more complex (generic) types and functions. 

![A functor in programming](../06_functors/functor_programming.svg)

But let's start with the basics - defining the concept of a functor in programming context is as simple as changing the terms we use, according to the table in chapter 2 (the one that compares category theory with programming languages), and (perhaps more importantly) changing the font we use in our formulas from "modern" to "monospaced".

> A functor between two categories (let's call them `A` and `B`) consists of a mapping that maps each ~~object~~ *type* in `A` to a type in `B` and a mapping that maps each ~~morphism~~ *function* between types in `A` to a function between types in `B`, in a way that preserves the structure of the category.

Comparing these definitions makes us realize that mathematicians and programmers are two very different communities, that are united by the fact that they both use functors (and by their appreciation of peculiar typefaces).

Type mapping
---

The first component of a functor is a mapping that converts one type (let's call it `A`) to another type (`B`). So it is *like a function, but between types*. Such constructions are supported by almost all programming languages that have static type checking in the first place - they go by the name of *generic types*. A generic type is nothing but a function that maps one (concrete) type to another (this is why generic types are sometimes called *type-level functions*). 

![A functor in programming - type mapping](../06_functors/functor_programming_objects.svg)

Note that although the diagrams they look similar, a *type-level* function is completely different from a *value-level* function. A value-level function from `String`, to `List<String>` (or in mathy Haskell/ML-inspired notation $string \to List\ string$ is) converts a *value* of type `String` (such as `"foo"`) and to a value of type `List<String>`. You even have (as we will see later) a value-level functions with signature $a \to List\ a$ that can convert any value to a list of elements containing that value, but this is different from the *type-level* function `List<A>` as that one converts a *type* $a$ to a *type* $List\ a$ (e.g. the type `string` to the type $List\ string$, $number$ to $List\ number$ etc.).

Function mapping
---

So the type mapping of a functor is simply a generic type in a programming language (we can also have functors between two generic types, but we will review those later). So what is the *function mapping* - that is a mapping that convert any function operating on simple types, like $string \to number$ to a function between their more complex counterparts e.g. $List\ string \to List\ number$.

![A functor in programming - function mapping](../06_functors/functor_programming_morphisms.svg)

In programming languages, this mapping is represented by a higher-order function called `map` with a signature (using Haskell notation), $(a \to b) \to (Fa \to Fb)$, where $F$ represents the generic type.

Note that although any possible function that has this type signature (that that obeys the functor laws) gives rise to a functor, *not all such functors are useful*. Usually, there is only one of them that makes sense for a given generic type and that's why we talk about *the* list functor, and see `map` is defined directly in the in the generic datatype, as a method.

In the case of lists and similar structures, the *useful* implementation of `map` is the one that applies the original (simple) function to all elements of the list. 

```
class Array<A> {
  map (f: A ➞ B): Array<B> {
    let result = [];
    for (obj of this) {
      result.push(f(obj));
    }
    return result;
  }
}
```

Functor laws
---

Aside from facilitating code reuse by bringing in all standard functions of simple types in a more complex context, `map` allows us to work in a way that is predictable, courtesy of the functor laws, which in programming context look like this.

Identity law:
```
a.map(a => a) == a
```
Composition law:
```
a.map(f).map(g) == a.map((a) => g(f(a)))
```

**Task:** Use examples to verify that the laws are followed.

What are functors for
===

Now, that we have seen so many examples of functors, we finally can attempt to answer the million-dollar question, namely what are functors for and why are they useful? (often formulated also as "Why are you wasting your/my time with this (abstact) nonsense?") 

Well, we saw that *maps are functors* and we know that *maps are useful*, so let's start from there. 

So, why is a map useful? Well, it obviously has to do with the fact that the points and arrows of the map corresponds to the cities and the roads in the place you are visiting in i.e. due to the very fact that it is a functor, but there is a second aspect as well - maps (or at least those of them that are useful) are *simpler to work with* than the actual things they represent. For example, road maps are useful, because they are *smaller* than the territory they represent, so it is much easier to go look up the routes between two given places by following a map, than to actually travel through all them in real life. 

And functors in programming are used for similar reason - functions that involve simple types like `string`, `number`, `boolean` etc. are ... simple, and least when compared with functions that work with lists and other generic types. Using the `map` function allows us to operate on such types without having to think about them and to derive functions that transform them, from functions that transform simple values. In other words, functors are means of *abstraction*.

Of course, not all routes on the map and no functions that between generic datatypes can be derived just by functions between the types they contain. This is generally true for many "useful" functors: because their source categories are "simpler" than the target, some of the morphisms in the target have no equivalents in the source i.e. making the model simpler inevitably results in losing some of its capabilities. This is a consequence of "the map is not the territory" principle (or in programming context, "every abstraction is a leaky abstraction", as Joel Spolsky put it): 

Pointed functors
===

Now, before we close it off, we will review one more functor-related concept that is particularly useful in programming - *pointed endofunctors.*

Endofunctors
---

To understand what pointed endofunctors are, we have to first understand what are *endofunctors*, and we already saw some examples of those in the last section. Let me explain: from the way the diagrams there looked like, we might get the impression that different type families belong to different categories.

![A functor in programming](../06_functors/functor_programming.svg)

But that is not the case - all type families from a given programming language are actually part of one and the same category - the category of *types*.

![A functor in programming](../06_functors/functor_programming_endo.svg)

Wait, so this is permitted? Yes, these are exactly what we call *endofunctors* i.e. ones that have one and the same category as source and target.

The identity functor
---

So, what are some examples of endofunctors? I want to focus on one that will probably look familiar to you - it is the *identity functor* of each category, the one that maps each object and morphism to itself.

![Identity  functor](../06_functors/identity_functor.svg)

And it might be familiar, because an identity functor is similar to an identity morphism - it allow us to talk about value-related stuff without actually involving values. 

Pointed functors
---

Finally, the identity functor, together with all other functors to which the identity functor can be *naturally transformed* are called *pointed functors* (i.e. a functor is pointed if there exist a morphism from the identity functor to it). As we will see shortly, the list functor is a pointed functor.

![Pointed functor](../06_functors/pointed_functor.svg)

We still haven't discussed what does it mean for one functor to be naturally transformed to another one (although the commuting diagram above can give you some idea). This is a complex concept and we have a whole chapter about it (the next one). 

However if we concentrate solely on the category of types in programming languages, then *a natural transformation is just a function* that translates each value of what we called the "simple types" to a value of the functor's generic type i.e. $a \to F\ a$), in a way that this diagram commutes.

![Pointed functor in Set](../06_functors/pointed_functor_set.svg)

What does it take for this diagram to commute? It means that the you have two equivalent routes for reaching from the top-left diagonal to the bottom-right diagonal i.e. that applying any function between any two types ($a \to b$), followed by the lifting function ($b \to F\ b$), is equivalent to applying the lifting function first ($a \to F\ a$), and then the mapped version of the original function second ($F\ a \to F\ b$).

The list functor is pointed, because such a function exist for the list functor - it is the function $a \to [\ a\ ]$ that puts every value in a "singleton" list. So, for every function between simple types, such as the function $length:\ string \to number$ we have a square like this one.

![Pointed functor in Set](../06_functors/pointed_functor_set_internal.svg)

And the fact that the square commutes is expressed by the following equality:

```
[a].map(f) = [f(a)]
```
By the way, it may not look like it right now, but this commuting square might be the one of the most-important diagram that exist in category theory, second to only the triangle of functional composition.

The category of small categories
===

Ha, I got you this time (or at least I *hope* I did) - you probably thought that I won't introduce another category in this chapter, but this is exactly what I am going to do now. And (surprise again) the new category won't be the category of functors (don't worry, we will introduce that in the next chapter). Instead, we will examine the category of (small) categories, that has all the categories that we saw so far as objects and functors as its morphisms, like $Set$ - the category of sets, $Mon$, the category of monoids, $Ord$, the category of orders etc.

![The category of categories](../06_functors/category_of_categories.svg)

We haven't yet mentioned the fact that functors compose (and in an associative way at that), but since a functor is just a bunch of functions, it is no wonder that it does.

**Task:** Go through the functor definition and see how do they compose. 

**Question:** What are the initial and terminal object of the category of small categories.

Categories all the way down
---

The recursive nature of category theory might leave some of you confused: we started by saying that categories are *composed of objects and morphisms*, but now we are saying that there are *morphisms between categories* (functors). And on top of that, there is a category where *the objects are categories themselves*. Does that mean that categories are an example of... categories? Sounds a bit weird on intuitive level (as for example biscuits don't contain other biscuits and houses don't use houses as building material) but it is actually the case. Like, for example, every monoid is a category with one just object, but at the same time, monoids can be seen as belonging to one category - the category of monoids - with monoid homomorphisms acting as objects. At the same time we have the category of groups, for example, which contains the category of monoids as a subcategory, as all monoids are groups etc.

Category theory does *categorize* everything, so, from a category-theoretic standpoint, all of maths is *categories all the way down*. Whether you would threat a given category as a universe or as a point depends solemnly on the context. Category theory is an *abstract* theory. That is, it does not seek to represent an actual state of affairs, but to provide a language that you can use to express many different ideas, actual or purely imaginary.
