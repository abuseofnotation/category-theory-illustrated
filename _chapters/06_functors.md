---
layout: default
title: Functors
---

Functors
===

This chapter we will change the tactic a bit (as I am sure you are a bit tired of jumping through different subjects) and we will examine some purely categorical concepts, using the structures that we saw so far as context. We will also generalize some of the concepts that we saw in these structures so they are valid for all categories.

Categories we saw so far
===

We already learned about many different types of categories: categories that have just one *object* (monoids, groups) 

![Types of categories](category_types_monoid.svg)

Categories that have only one *morphism* between any two objects (preorders, partial orders). 

![Types of categories](category_types_order.svg)

We also defined a lot of categories based on different things most notably the ones based on logics/programming languages, but also less "serious ones", as for example the color-mixing one. Serious or not, we saw that many of these categories share some similarities, as for example both the color-mixing order and categories that represent logic have greatest and least objects.

![Category of colors](category_color_mixing.svg)

To pinpoint such similarities and understand what they mean, we specify formal ways to connect categories to one another.

Categorical Isomorphisms
===

In chapter 1 we talked about set isomorphisms, which establish an equivalence between two sets. If you remember a set isomorphism is a *two-way function* between two sets or, alternatively, two "twin" functions each of which equals identity when composed with the other. 

![Set isomorphism](set_isomorphism.svg)

Then, in chapter 4, we mentioned order isomorphisms and saw that they are the same thing as set isomorphisms, but with one extra condition - aside from being there, the functions that define the isomorphism have to preserve the order of the elements i.e. all elements have to have the same arrows pointing to and from them. Or more formally put: **a** and **b**, **a ≤ b** iff **F(a) ≤ F(b)**. 

![Order isomorphism](order_isomorphism.svg)

We can extend this definition to work for categories as well. However, unlike orders, categories can have more than one morphism between two objects, so the definition is a little more complex. It is the following: given two categories, an isomorphism between them is an invertible function between the underlying sets of objects, *and* an invertible function between the morphisms that connect them, which maps each morphism to a morphism with the same signature. If you haven't seen the word, the "signature" of a function is just its input and output, so two functions have the same signature if they have the same input and output.

![Category isomorphism](category_isomorphism.svg)

Although longer, this definition is the same as the one we have for orders - it is just that with categories we can have more than one morphism between two objects and so we need to explicitly specify which one corresponds to which, while in order theory we only need to verify that the corresponding morphism actually exist (which is done by the *order-preserving* condition.)

So those are categorical isomorphisms. But isomorphisms are actually very rare. The only one that comes to mind is the Curry-Howard-Lambek isomorphism from the last chapter. 

If two categories are isomorphic they basically contain the same data and it would be more accurate to refer to them as different representations of the same category, then as separate categories.

<!--
comics:
OK, I think I got it - isomorphisms are when you have two similar pictures and you connect the dots.

Pretty much.
-->

What are functors
===

Much more abundant than isomorphisms, which are two-way connections between categories, are one-way connections between categories, which we will examine next. As you might have guessed, those are called functors.

They are more abundant than isomorphisms because each isomorphism is also a functor (actually two functors).

*Functors* work like this - a functor between two categories (let's call them **A** and **B**) consists of one function that maps the *objects* of **A** to the objects of **B** and one function that maps all *morphisms* of **A** to morphisms of **B** in a way that preserves the structure of the category.

![Functor](functor.svg)

Let's go through each component of this definition.

Object function
---

Firstly, we have a function between the categories' objects. These are just regular old functions, so the definition from chapter 1 applies here.

> A function is a relationship between two sets which matches each element of one set, called the *domain* of the function, with exactly one element from another set, called the converse domain, or the *codomain* of the function.

Formally, this component of the functor can be defined as a function between the categories' *underlying sets*.

![Functor for objects](functor_objects.svg)

Morphism function
---

The other component of a functor is a function between morphisms. Intuitively, we can think of it as just a regular function as well, but with the added requirement that it preserves the morphism's domain and codomain.

![Functor for morphisms](functor_morphisms.svg)

A more rigorous definition of a morphism function involves the concept of the *homomorphism set* - this is a set that contains all morphisms that go between given two objects in a given category as its elements. Utilizing this concept, we can say that a function between the morphisms of the two categories is actually a collection of the functions between their respective homomorphism sets.

![Functor for morphisms](functor_morphisms_formal.svg)

Note how the concepts of "homomorphism set" and of "underlying set" allowed us to "escape" to set theory when defining categorical concepts. We will see more of this.

Functor laws
---

So these are the two components that form a functor. But aside from defining them we should verify that they preserve the structure of the source category into the target. What is the structure of a category? As stated in the category definition in chapter 2:

> A category is a collection of **objects** (we can think of them as points) and **morphisms** (arrows) that go from one object to another, where:
> 1. Each object has to have the identity mophism.
> 2. There should be a way to compose two morphisms with an appropriate type signature into a third one in a way that is associative.

So this requirement translates to the following two laws, which are called the *functor laws*

1 Functions between morphisms should *preserve identities* i.e. all identity morphisms should be mapped to other identity morphisms.

![Functor](functor_laws_identity.svg)

2 They should also *preserve composition* i.e. for any two morphisms **f** and **g**, the morphism that corresponds to their composition **F(g f)** in the source category should be the same as the morphism that corresponds to the composition of their counterparts in the target directory, so **F(g) F(f)**.

![Functor](functor_laws_composition.svg)

And this is all there is to it about functors - a simple but, as we will see shortly, very powerful idea.

Some examples 
===
We will continue with a random list of examples for functors

<!--
comics
Hello, I am writing a category theory guide, can you tell me which are your three favourite functors.

Let's take turns asking ourselves personal questions. I'll start: which are your three favourite functors?
-->

Diagrams
---

Let's start with one that is very meta. Consider a diagram, any diagram from this book. By definition diagrams are, or aim to be, some kind of description of reality, so in order to understand them we have to relate them to some real-world situation i.e. we have to associate each object from the diagram with an object from the external world, and also each morphism from the diagram with some kind of relationship that your objects have. 

So when you are perceiving a diagram, you are actually creating a functor in your head.

For example, if we consider the preorder representing different cities and the roads in a given region. 

A diagram that represents that order is actually just a map of the region where the cities are located.


Monoid functors
---

As we said, a monoid is a with just one object, so if we decide not to care about the properties of the different objects we can collapse a category into a monoid.

On the other hand, each category that has *products* (so all that we reviewed here) has a corresponding monoid, such that there is a functor between the monoid and the category. For that reason, these categories are known also as *monoidal categories*.

Order functors
---
As with monoids, we can write a functor that collapses any category into an preorder by mapping all morphisms to one. We actually did this with logical categories to simplify things up a bit.

Functors in programming
---

In programming, defining a functor entails defining a way to lifts all functions defined in the category of *simple types* (like string, number etc) in a way that they work for a category of *parametrized types* (like list map etc), and thus allows you to *reuse these functions* in the other context.

This is done with a higher-order function usually called `map` that converts a function accepting and returning values of simple type **(a -> b)** to a function that accepts and returns the corresponding parametrized types **(Fa -> Fb)**. 

Why is this useful? If we think about the category of simple types, there are numerous functions between them, like even if we take functions between strings and numbers, there are a lot.

But for a category of parametrized types, as for example the category of lists, there aren't that many.

However having `map` (which for lists has the type `(a -> b) -> ([a] -> [b])`) allows you to bring out these functions, defined in the category of simple types, like (`int -> string`) to the one for the more complex ones, like (`[int] -> [string]`).

Aside from facilitating code reuse by bringing in all standard functions of simple types in a more complex context, `map` allows us to work in a simpler context when defining new functions and do so in a way that is predictable, due to the functor laws, which in programming context look like the following:

```
a.map((a => a) == a

a.map(f).map(g) == a.map((v) => g(f(v)))
```

Functors as maps
---

Functors as selections
---

Set-valued functors
===

Homomorphism functors
---

Representable functors
---

Representable functors are set-valued functors that are isomorphic to the Hom functor

A Hom-functor can always be converted to any set-valued functor (Yoneda lemma). But not the other way around

So a functor is representable when we can convert its values to values of the Hom functor

Functors as a category
===

