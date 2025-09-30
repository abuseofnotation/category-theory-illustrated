---
layout: default
title: Functors
---

Functors 
===

From this chapter on, we will change the tactic a bit (as I am sure you are tired of jumping through different subjects) and we will dive at full throttle into the world of categories, using the structures that we saw so far as context. This will allow us to generalize some of the concepts that we examined in these structures and thus make them (the concepts) valid for all categories. 

Categories we saw so far
===

So far, we saw many different categories and category types. Let's review them once more:

The category of sets
---

We began by reviewing the mother of all categories --- *the category of sets*.

![The category of sets](../10_functors/category_sets.svg)

We also saw that it contains within itself many other categories, such as the category of types in programming languages.

Special types of categories 
---

We also learned about other algebraic objects that turned out to be just *special types of categories*, like categories that have just one *object* (monoids, groups) and categories that have only one *morphism* between any two objects (preorders, partial orders).

![Types of categories](../10_functors/category_types.svg)

Other categories
---

We also defined a lot of *categories based on different concepts*, like the ones based on logics/programming languages, but also some "less-serious ones", as for example the color-mixing partial order/category.

![Category of colors](../10_functors/category_color_mixing.svg)

Finite categories
---

And most importantly, we saw some categories that are *completely made up*, such as my soccer player hierarchy. Those are formally called *finite categories*. 

![Finite categories](../10_functors/finite_categories.svg)

Although they are not useful by themselves, the idea behind them is important --- we can draw any combination of points and arrows and call it a category, in the same way that we can construct a set out of every combination of objects. 

Examining some finite categories
---

For future reference, let's see some important finite categories. 

The simplest category is $0$ (enjoy the minimalism of this diagram).

![The finite category 0](../10_functors/finite_zero.svg)

The next simplest category is $1$ --- it is comprised of one object and no morphisms besides its identity morphism (which we don't draw, as usual)

![the finite category 1](../10_functors/finite_one.svg)

If we increment the number of objects to two, we see a couple of more interesting categories, like for example the category $2$ containing two objects and one morphism.

![the finite category 2](../10_functors/finite_two.svg)

---
**Task 1:** There are just two more categories that have 2 objects and at most one morphism between two objects, draw them.

![the finite category 2](../10_functors/finite_two_task.svg)

---

And finally the category $3$ has 3 objects and also 3 morphisms (one of which is the composition of the other two).

![the finite category 3](../10_functors/finite_three.svg)

Categorical isomorphisms
===

Many of the categories that we saw are similar to one another, as for example, both the color-mixing order and categories that represent logic have a *greatest* and a *least* object. To pinpoint such similarities, and understand what they mean, it is useful to have formal ways to connect categories with one another. The simplest type of such connection is the good old isomorphism.

Set isomorphisms
---

In chapter 1 we talked about *set isomorphisms*, which establish an equivalence between two sets. In case you have forgotten, a set isomorphism is a *two-way function* between two sets. 

![Set isomorphism](../10_functors/set_isomorphism.svg)

It can alternatively be viewed as two "twin" functions such that each of which equals identity, when composed with the other one. 


Order isomorphisms
---

Then, in chapter 4, we encountered *order isomorphisms* and we saw that they are like set isomorphisms, but with one extra condition --- aside from just being there, the functions that define the isomorphism have to preserve the order of the object e.g. the greatest object of one order should be connected to the greatest object of the other one, the least object of one order should be connected to the least object of the other one, and same for all objects that are in between. 

![Order isomorphism](../10_functors/order_isomorphism.svg)

Or more formally put, for any $a$ and $b$ if we have $a ≤ b$ we should also have $F(a) ≤ F(b)$ (and vise versa).

Categorical isomorphisms
---

Now, we will generalize the definition of an order isomorphism, so it also applies to all other categories (i.e. to categories that may have more than one morphism between two objects): 

> Given two categories, an isomorphism between them is an invertible mapping between the underlying sets of objects, *and* an invertible mapping between the morphisms that connect them, which maps each morphism from one category to a morphism *with the same signature*.

![Category isomorphism](../10_functors/category_isomorphism.svg)

After examining this definition closely, we realize that, although it *sounds* a bit more complex (and *looks* a bit messier) than the one we have for orders *it is actually the same thing*. 

It is just that the so-called "morphism mapping" between categories that have just one morphism for any two objects are trivial, and so we can omit them.

![Order isomorphism](../10_functors/category_order_isomorphism_2.svg)

**Task 2:** What is the morphism mapping for orders?

<!--
We always map the single morphism of the source category to the single morphism of the target category (which is guaranteed to exist, due to the *order-preserving* condition)
-->

However, when we can have more than one morphism between two given objects, we need to make sure that each morphism in the source category has a corresponding morphism in the target one, and for this reason we need not only a mapping between the categories' objects, but one between their morphisms.

![Category isomorphism](../10_functors/category_order_isomorphism.svg)

By the way, what we just did (taking a concept that is defined for a more narrow structure (orders) and redefining it for a more broad one (categories)) is called *generalizing* of the concept.

The problem with categorical isomorphisms
---

By examining them more closely, we realize that categorical isomorphisms are not so hard to define. However there is another issue with them, namely that they *don't capture the essence of what categorical equality should be*. I have devised a very good and intuitive explanation why is it the case, that this ~~margin~~ section is too narrow to contain. So we will leave it for the next chapter, where we will also devise a more apt way to define a *two-way connection* between categories. 

But first, we need to examine *one-way connections* between them, i.e. *functors*.

PS: Categorical isomorphisms are also *very rare in practice* --- the only one that comes to mind is the Curry-Howard-Lambek isomorphism from the previous chapter. That's because if two categories are isomorphic then there is no reason at all to treat them as different categories --- they are one and the same. 

<!--
comics:
OK, I think I got it --- isomorphisms are when you have two similar pictures and you connect the dots.

Pretty much.
-->

What are functors
===

The logician Rudolf Carnap coined the term "functor" as part of his project to formalize the syntax for the natural languages such as English in order to create a precise way for us to talk about science. Originally, a functor meant a word or phrase whose meaning can be customized by combining it with a numerical value, such as the phrase "the temperature at $x$ o'clock", which has a different meaning depending on the value of $x$.

In other words, a functor is a phrase that *acts as a function*, only not a function between sets, but one between *linguistic concepts* (such as times and temperature).

![Functor, as envisioned by Rudolf Carnap.](../10_functors/functor_carnap.svg)

Later, one of the inventors of category theory Sanders Mac Lane borrowed the word, to describe a something that *acts as function between categories*, which he defined in the following way:

> A functor between two categories (let's call them $A$ and $B$) consists of two mappings --- a mapping that maps each *object* in $A$ to an object in $B$ and a mapping that maps each *morphism* between any objects in $A$ to a morphism between objects in $B$, in a way that *preserves the structure* of the category. 

![Functor](../10_functors/functor.svg)

Now let's unpack this definition by going through each of its components.

Object mapping
---

In the definition above, we use the word "mapping" to avoid misusing the word "function" for something that isn't exactly a function. But in this particular case, calling the mapping a function would barely be a misuse --- if we forget about morphisms and treat the source and target categories as sets, the object mapping is nothing but a regular old function.

![Functor for objects](../10_functors/functor_objects.svg)

A more formal definition of object mapping involves the concept of an *underlying set* of a category: Given a category $A$, the underlying set of $A$ is a set that has the objects of $A$ as elements. Utilizing this concept, we say that the object mapping of a functor between two categories is *a function between their underlying sets*. The definition of a function is still the same:

> A function is a relationship between two sets that matches each element of one set, called the *source set* of the function, with exactly one element from another set, called the *target set* of the function. 

Morphism mapping
---

The second mapping that forms the functor is a mapping between the categories' morphisms. This mapping resembles a function as well, but with the added requirement that each morphism in $A$ a given source and target must be mapped to a morphism with the corresponding source and target in $B$, as per the object mapping.

![Functor for morphisms](../10_functors/functor_morphisms.svg)

A more formal definition of a morphism mapping involves the concept of the *homomorphism set*: this is a set that contains all morphisms that go between two given objects in a given category. When utilizing this concept, we say that a mapping between the morphisms of two categories consists of a *set of functions between their respective homomorphism sets*.

![Functor for morphisms](../10_functors/functor_morphisms_formal.svg)

Notice how the concepts of *homomorphism set* and of *underlying set* allowed us to "escape" to set theory when defining categorical concepts and define everything using functions? 

Functor laws
---

So these are the two mappings (one between objects and one between morphisms) that constitute a functor. But not every pair of such two mappings is a functor. As we said, in addition to existing, the mappings should *preserve the structure* of the source category into the target category. To see what that means, we revisit the definition of a category from chapter 2:

> A category is a collection of *objects* (we can think of them as points) and *morphisms* (arrows) that go from one object to another, where:
> 1. Each object has to have the identity morphism.
> 2. There should be a way to compose two morphisms with an appropriate type signature into a third one, in a way that is associative.

So this definition translates to the following two *functor laws*

1. Functions between morphisms should *preserve identities* i.e. all identity morphisms should be mapped to other identity morphisms.
 ![Functor](../10_functors/functor_laws_identity.svg)

2. Functors should also *preserve composition* i.e. for any two morphisms $f$ and $g$, the morphism that corresponds to their composition $F(g•f)$ in the source category should be mapped to the morphism that corresponds to the composition of their counterparts in the target directory, so $F(g•f) = F(g)•F(f)$.

 ![Functor](../10_functors/functor_laws_composition.svg)

And these laws conclude the definition of functors --- a simple but, as we will see shortly, very powerful concept. 

To see *why* is it so powerful, let's check some examples. 

Functors in everyday language
---

There is a common figure of speech (which is used  all the time in this book) which goes like this: 

> If $a$ is like $F a$, then $b$ is like $F b$.

Or "$a$ is related to $F a$, in the same way as $b$ is related to $F b$," e.g. "If schools are like corporations, then teachers are like bosses". 

This figure of speech is nothing but a way to describe a functor in our day-to-day language: what we mean by it is that there is a certain set of connections (or category-theory terms a "morphisms") between schools and teachers, that is similar to the connections between corporations and bosses i.e. that there is some kind of structure-preserving map that connects the category of school-related things, to the category of work-related things which maps schools ($a$) to corporations ($F a$) and teacher ($b$) to bosses ($F b$), and which is such that the connections between schools and teachers ($a \to b$) are mapped to the connections between corporations and bosses ($F a \to F b$).

Diagrams are functors
---

> “A sign is something by knowing which we know something more.” — Charles Sanders Peirce

We will start with an example of a functor that is very *meta* --- the diagrams/illustrations in this book.

You might have noticed that diagrams play a special role in category theory --- while in other disciplines their function is merely complementary i.e. they only show what is already defined in another way, here *the diagrams themselves serve as definitions*. 

For example, in chapter 1 we presented the following definition of functional composition.

> The composition of two functions $f$ and $g$ is a third function $h$ defined in such a way that this diagram commutes.

![Functional composition - general definition](../10_functors/functions_compose_general.svg)

We all see the benefit of defining stuff by means of diagrams as opposed to writing lengthy definitions like

> "Suppose you have three objects $a$, $b$ and $c$ and two morphisms $f: b \to c$ and $g: a \to b$..."

However, it (defining stuff by means of diagrams) presents a problem --- definitions in mathematics are supposed to be formal, so if we want to use diagrams as definitions we must first *formalize the definition of a diagram itself*. 

So how can we do that? One key observation is that diagrams look as finite categories, as, for example, the above definition looks in the same way as the category $3$.

![the finite category 3](../10_functors/finite_three.svg)

However, this is only part of the story as finite categories are just structures, whereas diagrams are *signs*. They are "something by knowing which we know something more.", as Peirce famously put it (or "...which can be used in order to tell a lie", in the words of Umberto Eco). 

For this reason, aside from a finite category that encodes the diagram's structure, the definition of a diagram must also include a way for "interpreting" this category in some other context i.e. they must include *functors*.

![diagram as a functor](../10_functors/diagram_functor.svg)

This is how the concept of functors allows us to formalize the notion of diagrams: 

> A *diagram* is comprised of one finite category (called an *index category*) and a functor from it to some other category.

If you know about semiotics, you may view the source and target categories of the functor as *signifier* and *signified*.

And so, you can already see that the concept of a functor plays a very important role in category theory. Because of it, diagrams in category theory can be *specified formally* i.e. they are categorical objects *per se*. 

You might even say that they are categorical objects *par excellence* (TODO: remove that last joke).

<!--
(TODO: By the way, the fact that a diagram commutes means just that the morphism in the finite category are sometimes composites of one another).
-->

Maps are functors
---

> A map is not the territory it represents, but, if correct, it has a similar structure to the territory, which accounts for its usefulness. --- Alfred Korzybski

Functors are sometimes called "maps" for a good reason --- maps, like all other diagrams, are functors. If we consider some space, containing cities and roads that we travel by, as a category, in which the cities are objects and roads between them are morphisms, then a road map can be viewed as category that represent some region of that space, together with a functor that maps the objects in the map to real-world objects.

![A map and a preorder of city pathways](../10_functors/preorder_map_functor.svg)

In maps, morphisms that are a result of composition are often not displayed, but we use them all the time --- they are called *routes*. And the law of preserving composition tells us that every route that we create on a map corresponds to a real-world route. 

![A map and a preorder of city pathways](../10_functors/preorder_map_functor_route.svg)

Notice that in order to be a functor, a map does not have to list *all* roads that exist in real life, and *all* traveling options ("the map is not the territory"), the only requirement is that *the roads that it lists should be actual* --- this is a characteristic shared by all many-to-one relationships (i.e. functions).

<!--
Functors can also go from complex to simple
---

So far, we saw functors that go from a simple category, into a more complex one, which aim to *select* some objects from the target category*.

But functors can go the other way too --- from complex to simple --- those are the functors which *sort* the object of the source category into the categories that constitute the target.


Even more interestingly, we often encounter often special pairs of functors, consisting of one *selective* and one *sorting* functor that go between two categories, that kinda reverse each other. 

--> 

Human perception might be functorial 
---

As we saw, in addition to category theory, functors appear in many disciplines that study the human mind, such as logic, linguistics, semiotics and the like. I thought about why is it so in a [blog post](https://abuseofnotation.github.io/logic-thought) that I wrote. My response to that question is that human perception, human thinking, is itself functorial: to perceive the world around us, we are going through a bunch of functors that go from more raw "low-level" mental models to more abstract "high-level" ones. 

We may say that perception starts with raw sensory data. From it, we go, (using a functor) to a category containing some basic model of how the world works, mapping the objects we are seeing to some concepts that we formed in our mind.

![Perception is functorial](../10_functors/chain.svg)

Then we are connecting this model to another, even more abstract model (or models), which provide us with a higher-level overview of the situation that we are in, again using functorial connection (technically these are functors from subcategories).

![Perception is functorial](../10_functors/logic_thought.svg)

You can view this as a progression of connections that go from simpler to more abstract (i.e. from categories with less morphisms to categories with more morphisms). 

These connections are functorial in nature, because they work purely in terms of *structure*: the idea of a given object has nothing in common with the object itself (e.g. the idea of a biscuit isn't round, sweet etc). What ideas have in common with the objects of representation is that the connections they have between one another mimic some connections a real-life biscuit has with other objects.


All this is, of course, just a speculation, but how else would we be capable of forming thoughts, e.g. to imagine a person riding a bike and bumping in a tree, when no part of our brains (nor the impulses they create) resembles in any way people/bikes/trees?

The answer is structure --- thoughts have the structure of the situation, that's why they refer to it (although they cannot refer to any of the elements by itself).

Functors in monoids
===

So, after this slight detour, we will return to our usual modus operandi.

Hey, do you know that in group theory, there is this cool thing called *group homomorphism* (or *monoid homomorphism* when we are talking about monoids) --- it is a function between the groups' underlying sets which preserves the group operation.

So, for example, If the time of the day right now is 00:00 o'clock (or 12 PM) then what would the time be after $n$ hours? The answer to this question can be expressed as a function with the set of integers as source and target.

![Group homomorphism as a function](../10_functors/group_homomorphism_function.svg)

This function is interesting --- it preserves the operation of (modular) addition: if, 13 hours from now the time will be 1 o'clock and if 14 hours from now it will be 2 o'clock, then the time after (13 + 14) hours will be (1 + 2) o'clock. 

![Group homomorphism](../10_functors/group_homomorphism.svg)

Or to put it formally, if we call it (the function) $F$, then we have the following equation: $F(a + b) = F(a) + F(b)$ (where $+$ in the right-hand side of the equation means modular addition). Because this equation holds, the $F$ function is a *group homomorphism* between the group of integers under addition and the group of modulo arithmetic with base 11 under modular addition (where you can replace 11 with any other number).


The groups don't have to be so similar for there to be a homomorphism between them. Take, for example, the function that maps any number $n$ to 2 to the *power of $n$,* so  $n \to 2ⁿ$ (here, again, you can replace 2 with any other number). This function gives a rise to a group homomorphism between the group of integers under addition and the integers under multiplication, or $F(a + b) = F(a) \times F(b)$.

![Group homomorphism between different groups](../10_functors/group_homomorphism_addition_multiplication.svg)

Wait, what were we talking about, again? Oh yeah --- group homomorphisms are functors. To see why, we switch to the category-theoretic representation of groups and revisit our first example and (to make the diagram simpler, we use $mod2$ instead of $mod11$).

![Group homomorphism as a functor](../10_functors/group_homomorphism_functor.svg)

It seems that when we view groups/monoid as one-object categories, a group/monoid homomorphism is just a functor between these categories. Let's see if that is the case.

Object mapping
---

Groups/monoids have just one object when viewed as categories, so there is also only one possible object mapping between any couple of groups/monoids --- one that maps the (one and only) object of the source group to the object of the target group (not depicted in the diagram).

Morphism mapping
---

Because of the above, the morphism mapping is the only relevant component of the group homomorphism. In the category-theoretic perspective, group objects (like $1$ and $2$ $3$ etc.) correspond to morphisms (like $+1$, $+2$ $+3$ etc.) and so the morphism mapping is just mapping between the group's objects, as we can see in the diagram.


Functor laws
---

The first functor law trivial, it just says that the one and only identity object of the source group (which corresponds to the identity morphism of its one and only object) should be mapped to the one and only identity object of the target group For groups, this even follows immediately from the second law and for monoids, it has to be added as an extra condition.

And if we remember that the group operation of combining two objects corresponds to *functional composition* if we view groups as categories, we realize that the group homomorphism equation $F(a + b) = F(a) \times F(b)$ is just a formulation of the second functor law: $F(g•f) = F(g)•F(f)$.

And many algebraic operations satisfy this equation, for example the functor law for the group homomorphism between $n \to 2ⁿ$ is just the famous algebraic rule, stating that $gᵃ gᵇ= gᵃ⁺ᵇ$.

**Task 3:** Prove that the first functor law (preservation of identities) of groups can be proven from the second law. Note that this is valid for groups, but not monoids.


Functors in orders
===

And now let's talk about a concept that is completely unrelated to functors, nudge-nudge (hey, bad jokes are better than no jokes at all, right?) In the theory of orders, we have the concept of functions between orders (which is unsurprising, given that orders, like monoids/groups, are based on sets) and one very interesting type of such function, which has applications in calculus and analysis, is a *monotonic function* (also called *monotone map*). This is a function between two orders that *preserves the order of the objects in the source order, in the target order. So a function $F$ is monotonic when for every $a$ and $b$ in the source order, if $a ≤ b$ then $F(a) ≤ F(b)$.

For example, the function that maps the current time to the distance traveled by some object is monotonic because the distance traveled increases (or stays the same) as time increases.

![A monotonic function](../10_functors/monotone_map.svg)

If we plot this or any other monotonic function on a line graph, we see that it goes just one direction (i.e. just up or just down).

![A monotonic function, represented as a line-graph](../10_functors/monotone_map_plot.svg)

Now we are about to prove that monotonic functions are functors too, ready?

Object mapping
---

Like with categories, the object mapping of an order is represented by a function between the orders' underlying sets. 

Morphism mapping
---

With monoids, the object mapping component of functors was trivial. Here is the reverse: the morphism mapping is trivial - given a morphism between two objects from the source order, we map that morphism to the morphism between their corresponding objects in the target order. The fact that the monotonic function respects the order of the elements, ensures that the latter morphism exists.

Functor laws
---

It is not hard to see that monotone maps obey the first functor law as identities are the only morphisms that go between a given object and itself. 

And the second law ($F(g \circ f) = F(g) \circ F(f)$) also follows trivially --- we just have to prove that if function $F$ preserves order, i.e. that if 

$$a ≤ b \to F(a) ≤ F(b)$$ 

and 

$$b ≤ c \to F(a) ≤ F(b)$$

then obviously 

$$F(a) ≤ F(c)$$

**Task 4:** Show why the law holds.

Linear functions
===

OK, enough with this abstract nonsense, let's talk about "normal" functions --- ones between numbers. 

In calculus, there is this concept of *linear functions* (also called "degree one polynomials") that are sometimes defined as functions of the form $f(x) = xa$ i.e. ones that contain no operations other than multiplying the argument by some constant (designated as $a$ in the example). 

But if we start plotting some such functions we will realize that there is another way to describe them --- their graphs are always comprised of straight lines.

![Linear functions](../10_functors/linear_functions.svg)

**Task 5:** Why are the graphs of linear functions comprised of straight lines?

Another interesting property of these functions is that most of them *preserve* addition, that is for any $x$ and $y$, you have $f(x) + f(y) = f(x + y)$. We already know that this equation is equivalent to the second functor law. So linear functions are just *functors between the group of natural numbers under addition and itself.* As we will see later, they are example of functors in the *category of vector spaces*.

![Linear functions](../10_functors/linear_function_functor.svg)

**Task 6:** Show that linear functions preserve addition.

And if we view that natural numbers as an order, linear functions are also functors as well, as all functions that are plotted with straight lines are obviously monotonic.

Note, however, that not all functions that are plotted straight lines preserve addition --- functions of the form $f(x) = x * a + b$ in which $b$ is non-zero, are also straight lines (and are also called linear) but they don't preserve addition.

![Linear functions](../10_functors/linear_function_non_functor.svg)

For those, the above formula looks like this: $f(x) + b + f(y) + b = f(x + y) + b$.

<!--

The category of topological spaces
---
The smoothness of the mapping means that paths may stretch or collapse but not break. 
-->


Functors in programming. The list functor
===

Types in a given programming language form a category, and in that category there are some functors that programmers use every day, such as the list functor, that we will use as an example. The list functor is an example of a functor that maps the realm of simple (primitive) types and functions to the realm of more complex (generic) types and functions. 

![A functor in programming](../10_functors/functor_programming.svg)

But let's start with the basics: defining the concept of a functor in programming context is as simple as changing the font we use in our formulas from "modern" to "monospaced". And also, using the more "programmy" terms listed in the table in chapter 2.

> A functor between two categories (let's call them `A` and `B`) consists of a mapping that maps each ~~object~~ *type* in `A` to a type in `B` and a mapping that maps each ~~morphism~~ *function* between types in `A` to a function between types in `B`, in a way that preserves the structure of the category.

Comparing these definitions makes us realize that mathematicians and programmers are two very different communities, that are united by the fact that they both use functors (and by their appreciation of peculiar typefaces).

Type mapping
---

The first component of a functor is a mapping that converts one type (let's call it `A`) to another type (`B`). So it is *like a function, but between types*. Such constructions are supported by almost all programming languages that have static type checking in the first place --- they go by the name of *generic types* . A generic type is nothing but a function that maps one (concrete) type to another (this is why generic types are sometimes called *type-level functions*). 

![A functor in programming - type mapping](../10_functors/functor_programming_objects.svg)

Note that although the diagrams they look similar, a *type-level* function is completely different from a *value-level* function, e.g. a value-level polymorphic function from `a`, to `List<a>` (or in mathy Haskell-inspired notation $forall\ a. a \to List\ a$) converts a *value* of type `a` to a value of type `List<a>` and is different from the *type-level* function `List<A>` as that one converts a *type* $a$ to a *type* $List\ a$ (e.g. the type `string` to the type $List\ string$, $number$ to $List\ number$ etc.). We will review value-level polymorphic functions at the end of the chapter.

Function mapping
---

So the type mapping of a functor is simply a generic type in a programming language (we can also have functors between two generic types, but we will review those later). So what is the *function mapping* --- this is a mapping that convert any function operating on simple types, like $string \to number$ to a function between their more complex counterparts e.g. $List\ string \to List\ number$.

![A functor in programming - function mapping](../10_functors/functor_programming_morphisms.svg)

In programming languages, this mapping is represented by a higher-order function called `map` with a signature (using Haskell notation), $(a \to b) \to (Fa \to Fb)$, where $F$ represents the generic type.

Note that, although any possible function that has this type signature (that that obeys the functor laws) gives rise to a functor, *not all such functors are useful*. Usually, there is only one of them that makes sense for a given generic type and that's why we talk about *the* list functor, and we define `map` directly in the in the generic datatype, as a method.

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

**Task 7:** Use examples to convince yourself that the laws are followed.
What are functors for
===

Now, that we have seen so many examples of functors, we finally can attempt to answer the million-dollar question, namely what are functors for and why are they useful? (often formulated also as "Why are you wasting your/my time with this (abstract) nonsense?") 

Well, we saw that *maps are functors* and we know that *maps are useful*, so let's start from there. 

So, why is a map useful? Well, it obviously has to do with the fact that the points and arrows of the map corresponds to the cities and the roads in the place you are visiting in i.e. due to the very fact that it is a functor, but there is a second aspect as well - maps (or at least those of them that are useful) are *simpler to work with* than the actual things they represent. For example, road maps are useful, because they are *smaller* than the territory they represent, so it is much easier to go look up the routes between two given places by following a map, than to actually travel through all of them in real life. 

And functors in programming are used for similar reason - functions that involve simple types like `string`, `number`, `boolean` etc. are ... simple, and least when compared with functions that work with lists and other generic types. Using the `map` function allows us to operate on such types without having to think about them and to derive functions that transform them, from functions that transform simple values. In other words, functors are means of *abstraction*.

Of course, not all routes on the map and no functions that between generic datatypes can be derived just by functions between the types they contain. This is generally true for many "useful" functors: because their source categories are "simpler" than the target, some of the morphisms in the target have no equivalents in the source i.e. making the model simpler inevitably results in losing some of its capabilities. This is a consequence of "the map is not the territory" principle ("every abstraction is a leaky abstraction", as Joel Spolsky puts it).

Pointed functors
===

Now, before we close it off, we will review one more functor-related concept that is particularly useful in programming - *pointed endofunctors.*

Endofunctors
---

To understand what pointed endofunctors are, we have to first understand what are *endofunctors*, and we already saw some examples of those in the last section. Let me explain: from the way the diagrams there looked like, we might get the impression that different type families belong to different categories.

![A functor in programming](../10_functors/functor_programming.svg)

But that is not the case - all type families from a given programming language are actually part of one and the same category - the category of *types*.

![A functor in programming](../10_functors/functor_programming_endo.svg)

Wait, so this is permitted? Yes, these are exactly what we call *endofunctors* i.e. ones that have one and the same category as source and target.

The identity functor
---

So, what are some examples of endofunctors? I want to focus on one that will probably look familiar to you - it is the *identity functor* of each category, the one that maps each object and morphism to itself.

![Identity  functor](../10_functors/identity_functor.svg)

And it might be familiar, because an identity functor is similar to an identity morphism - it allow us to talk about value-related stuff without actually involving values. 

Pointed functors
---

Finally, the identity functor, together with all other functors to which the identity functor can be *naturally transformed* are called *pointed functors* (i.e. a functor is pointed if there exist a natural transformation from the identity functor to it). As we will see shortly, the list functor is a pointed functor.

![Pointed functor](../10_functors/pointed_functor.svg)

We still haven't discussed what does it mean for one functor to be naturally transformed to another one (although the commuting diagram above can give you some idea), however, if we concentrate solely on the category of types in programming languages, then *a natural transformation is just a polymorphic function* e.g. this one is $a \to List\ a$, that preserves the structure of the types i.e. one for which this diagram commutes. 
![Pointed functor in Set](../10_functors/pointed_functor_set.svg)

In the case of this functor, the function in question is $a \to [\ a\ ]$ --- the function that puts every value in a "singleton" list. 

We will stop here, as natural transformations are a complex thing, and we want to examine them in a whole chapter (the next one).

The category of small categories
===

Ha, I got you this time (or at least I *hope* I did) - you probably thought that I won't introduce another category in this chapter, but this is exactly what I am going to do now. And (surprise again) the new category won't be the category of functors (don't worry, we will introduce that in the next chapter). Instead, we will examine the category of (small) categories, that has all the categories that we saw so far as objects and functors as its morphisms, like $Set$ - the category of sets, $Mon$, the category of monoids, $Ord$, the category of orders etc.

![The category of categories](../10_functors/category_of_categories.svg)

We haven't yet mentioned the fact that functors compose (and in an associative way at that), but since a functor is just a bunch of functions, it is no wonder that it does.

**Task 8:** Go through the functor definition and see how do functors compose. 

**Task 9:** What are the initial and terminal object of the category of small categories.

Categories all the way down
---

The recursive nature of category theory might sometimes leave us confused: we started by saying that categories are *composed of objects and morphisms*, but now we are saying that there are *morphisms between categories* (functors). And on top of that, there is a category where *the objects are categories themselves*. Does that mean that categories are an example of... categories? Sounds a bit weird on intuitive level (as for example biscuits don't contain other biscuits and houses don't use houses as building material), but it is actually the case. Like, for example, every monoid is a category with just one object, but at the same time, monoids can be seen as belonging to one category - the category of monoids, where they are connected by monoid homomorphisms. We also have the category of groups, for example, which contains the category of monoids as a subcategory, as all monoids are groups etc.

Category theory does *categorize* everything, so, from a category-theoretic standpoint, all of maths is *categories all the way down*. Whether you would treat a given category as a universe or as a point depends solely on the context. Category theory is an *abstract* theory. That is, it does not seek to represent an actual state of affairs, but to provide a language that you can use to express many different ideas.

<!--
{% if site.distribution == 'print' %}
-->

Answers 
===

---

**Task 1:** There are just two more categories that have 2 objects and at most one morphism between two objects, draw them.

The answer is this:

![the finite category 2](../10_functors/finite_two_task_solution.svg)

Isomorphisms are equaluty in category theory, so flipping the arrow from the left to the right doesn't count as a new category.

For the third category we have to specify what composing the morphism with itself would yield: 

$$f \circ f = id$$ 

This law guarantees that there would be just 1 morphism besides identity: if this law doesn't exist, you would end up with the category with an infinite amount of morphisms (see the free monoid in the chapter on monoids), if it is changed to something else, they would be a finite number of morphisms, but still more than 1.

---

**Task 2:** What is the morphism mapping for orders?

The morphism mapping of orders consist just of mapping the only existing morphism between a given pair of objects in one order, to the only existing morphism of their counterparts in the other order. The "order-preserving" condition of order isomorphisms guarantees that this morphism exists i.e. that if you have $A \to B$ in one order, you would have $F(A) \to F(B)$ in the other.

---

**Task 3:** Prove that the first functor law (preservation of identities) of groups can be proven from the second law i.e. that if $C$ and $D$ are groups and  $F: C \to D$ --- a group homomorphism, you have $ID_C = F(ID_D)$. Note that this is valid for groups, but not monoids.


We know that

$ID_D = ID_D \circ ID_D$

So

$F(ID_D) = F(ID_D) \circ F(ID_D)$ (second functor law)

But we can add the identity operation anywhere, without changing the equations, so we have

$F(ID_D) \circ ID_C = F(ID_D) \circ F(ID_D)$ (adding identity to the equation). 

And cancelling out $F(ID_D)$, we have

$ID_C = F(ID_D)$ 

This last step is valid only for groups, as cancelling out a morphism is done by applying it's reverse, and monoid morphisms don't have reverses.

---

**Task 4:** Show why the law holds.

In categorical language, the problem states that if we have $f : a \to b$ and $g : b \to c$, then $F(g \circ f) = F(g) \circ F(f)$.

The proof uses the same approach as the one in Task 2: because in orders there can be just one morphism with a given type signature, two morphisms with equal type signatures must be equal to one another.

Then, if we compose those two morphisms in the target order ($F(g)\circ F(f)$), we get a morphism $F(a) \to F(c)$

$$F(g)\circ F(f) : F(a) \to F(c)$$

If we compose the two morphisms in the *source* order, and we use the functor law to obtain the corresponding morphism in the target order, we get another morphism from object $F(a) \to F(c)$ 

$$F(g \circ f) : F(a) \to F(c)$$

But because in orders there can be just one morphism with signature $F(a) \to F(c)$ so these two morphisms must be equal to one another:

$$F(g)\circ F(f) = F(g \circ f)$$
 
---

**Task 5:** Why are the graphs of linear functions comprised of straight lines?

A linear function grows with a constant rate, (i.e. their derivative is always constant).

The slope of a function reflects the change in its rate of growth, so in case of linear functions it is a straight line.

---

**Task 6:** Show that linear functions preserve addition.

Let's say we have a function $f$, such that it multiplies the number by a certain constant $a$, e.g. we have

$f(x) = a \times x$

and 

$f(y) = a \times y $

If we sum the two we get

$f(x) + f(y) = a \times x + a \times y $

By the law of distributivity of addition we get

$f(x) + f(y) = a\times(x + y)$ 

but by the definition of $f$ we also have

$f(x + y) = a\times (x + y) $

Uniting the two terms that are both equal to $a\times (x + y)$ we get:

$f(x) + f(y) = f(x + y)$

You can show that this works in the other direction as well, but it is a little more complicated.

---

**Task 7:** Use examples to convince yourself that the laws are followed.

Trivial exercise, the point here is playing a bit to familiarize yourself with the laws, everyone has a favourite set and functions which they use, here are mine:

Identity law:
```
[1, 2, 3].map(a => a) == [1, 2, 3]
```
Composition law:
```
let f = (a) => a + 1
let g = (a) => a * 2
[1, 2, 3].map(f).map(g) == [1, 2, 3].map((a) => g(f(a)))
```
---

**Task 8:** Go through the functor definition and see how do functors compose. 

Another trivial exercise, with, perhaps, non-trivial setup. It all comes down to go through the elements a functor consists of and to see how the elements of two functors can compose. 

The two elements of a functor are the object mapping and the morphism mapping.

The object mapping is just a function, connecting two categories' underlying sets, so if we have two functors with the appropriate type signature e.g. 

$C \to D$ 

and 

$D \to E$

we also have two functions that connect these categories' underlying sets: 

$set(C) \to set(D)$ 

and

$set(D) \to set(E)$. 

So the answer, for object mapping is to compose the two functions to get a function (which can be the basis for a $C \to D$ functor)
$$set(C) \to set(E)$$.

For morphism mapping, do the same thing for the categories' hom-sets.

---

**Task 9:** What are the initial and terminal object of the category of small categories.

If you remember the concepts of initial and terminal objects from the category of sets $Set$, you will find out that they are basically the same for the category of categories $Cat$

The initial object in $Set$ is the empty set, the initial category in $Cat$ is the empty category. The unique functor from the empty category to any other category is the same --- the functor which maps nothing to nothing.

The terminal object in $Set$ is the one-element set, the terminal category in $Cat$ is the category $1$, which has one object and no morphisms other than identity. The unique functor from any object to the terminal object is the functor that maps all objects to the only object and all morphisms to the only morphism.

---

<!--
{%endif%}
-->

