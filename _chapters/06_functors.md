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

We also defined a lot of categories of different things most notably the ones based on logics/programming languages. But also less serious categories, as for example the color-mixing one. We even saw that those two categories have some similarities, like they are both distributive lattices and have greatest and least objects.

![Category of colors](category_color_mixing.svg)

But how exactly can we pinpoint such similarities and understand what they mean. How can we utilize the insights that we got from recognizing all of these structures as categories?  To do that, we must specify formal ways to connect categories to one another.

Categorical Isomorphisms
===

In chapter 1 we talked about set isomorphisms, which establish an equivalence between two sets. If you remember a set isomorphism is a two-way function between two sets. Or alternatively, you can think of an isomorphism as consisting of two "twin" functions each of which equals identity when composed with the other. 

![Set isomorphism](set_isomorphism.svg)

Then, in chapter 4 we mentioned order isomorphisms. They were the same thing as set isomorphisms, but with one extra condition - aside from being there, the function that defines the isomorphism has to preserve the order of the elements i.e. all elements have to have the same arrows pointing to and from them. Or more formally put: **a** and **b**, **a ≤ b** iff **F(a) ≤ F(b)**. 

![Order isomorphism](order_isomorphism.svg)

We can extend this definition to work for categories as well. Unlike orders, categories can have more than one morphism between two objects, so the definition would be a little more complex: given two categories, an isomorphism between them is an invertible function between the underlying sets of objects, *and* an invertible function between the morphisms that connect them, which maps each morphism to a morphism with the same signature (if you haven't seen the word, the "signature" of a function is just its domain and codomain, so two functions have the same signature if they have the same domain and codomain.)

![Category isomorphism](category_isomorphism.svg)

Although longer, this definition is the same as the one we have for orders - it is just that with categories we can have more than one morphism between two objects and so we need to explicitly specify which one corresponds to which, while in order theory we only need to verify that the corresponding morphism actually exist (which is done by the condition we added.)

So those are categorical isomorphisms. But isomorphisms are actually very rare. The only one that comes to mind is the Curry-Howard-Lambek isomorphism from the last chapter. 

If two categories are isomorphic, then they basically contain the same data and it would be more accurately to refer to them as different representations of the same category, then as separate categories.

<!--
comics:
OK, I think I got it - isomorphisms are when you have two similar pictures and you connect the dots.

Pretty much.
-->

What are functors
===

More useful than isomorphisms, which are two-way connections between categories, are one-way connections between them, which we will examine next. As you might have guessed, those are called functors.

*Functors* work like this - a functor between two categories (let's call them **A** and **B**) consists of one function that maps the *objects* of **A** to the objects of **B** and one function that maps all *morphisms* of **A** to morphisms of **B** in a way that preserves the structure of the category.

![Functor](functor.svg)

Let's go through each component of the definition.

Object function
---

Firstly, we have a function between the categories' objects, or between the categories' *underlying sets*, as you might put it. These are just regular old functions, so the definition from chapter 1 applies.

> A function is a relationship between two sets which matches each element of one set, called the *domain* of the function, with exactly one element from another set, called the converse domain, or the *codomain* of the function.

![Functor for objects](functor_objects.svg)

Morphism function
---

The other component of a functor is a function between morphisms. Intuitively, we can think of it as just a regular function as well, but with the added requirement that it preserves the morphism's domain and codomain.

![Functor for morphisms](functor_morphisms.svg)

A more rigorous definition of a morphism function involves the concept of the *homomorphism set* - this is a set that contains all morphisms that go between given two objects in a given category as its elements. Utilizing this concept, we can say that a function between the morphisms of the two categories is actually a collection of the functions between their respective homomorphism sets.

![Functor for morphisms](functor_morphisms_formal.svg)

Note how the concept of homomorphism set allowed us to "escape" to set theory when defining categorical concepts.

Functor laws
---

So these are the two components that form a functor. But aside from defining them we should verify that they preserve the structure of the source category into the target.

As stated in the category definition in chapter 2:

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

Let's start with one that is very meta. Consider a diagram, any diagram, from this book. By definition diagrams are, or aim to be, some kind of description of reality, so in order to understand them we have to relate them to some real-world situation i.e. we have to associate each object from the diagram with an object from the external world, and also each morphism from the diagram with some kind of relationship that your objects have. So you are creating a functor in your head.

The target of a functor may not be reality, it might be some other purely mathematical structure. In this case we have a functor between two diagrams.

Now let's try to draw some functors between the diagrams that we have here.

Monoid functors
---

Let's start with monoids. As we said, a monoid is a with just one object, so if we decide not to care about the properties of the different objects we can collapse a category into a monoid.

On the other hand, each category that has *products* (so all that we reviewed here) has a corresponding monoid, such that there is a functor between the monoid and the category. For that reason, these categories are known also as *monoidal categories*.

Order functors
---
As with monoids, we can write a functor that collapses any category into an preorder by mapping all morphisms to one. We actually did this with logical categories to simplify things up a bit.

Functors in programming
---
The concept of a functor is heavily used in programming to facilitate code reuse 

Given a category of simple types that have numerous functions between them. 

And given some more complex feature-rich version of these same category.

Defining a functor allows you to reuse the functions defined for the simple value in the more complex realm, by obtaining their equivalents in the more complex category.

In most cases, this is done by defining a higher-order function (usually called `map`) that converts a function accepting and returning simple types **(a -> b)** to a function that accepts and returns the corresponding complex values **(Fa -> Fb)**. 

For lists, `map` has the following type **(a -> b) -> ([a] -> [b])**.

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

