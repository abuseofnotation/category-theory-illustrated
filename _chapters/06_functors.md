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

We also defined a lot of categories of different things most notably the ones based on logics/programming languages.

![Category of programming languages](category_programming.svg)

But also less serious categories, as for example the color-mixing one

![Category of colors](color_mixing_category.svg)

And most importantly, we learned that we can make a category out of everything, from our city's road system, to soccer ranklist starring me and my grandmother. All these fall in the big hm... category of finite categories.

![Category of colors](finite_categories.svg)

And we saw one category that is neither a type, nor a domain, but it deserves to be mentioned - the category of sets and functions. 

![Set category](category_set.svg)

As various *subcategories* to that category, as for example the set inclusion orders. We saw that many other categories are similar to subcategories of the category of sets.

![Set category](category_set.svg)

Now, to utilize the insights that we get from recognizing all of these structures as categories, we will specify ways to connect categories to one another.

Categorical Isomorphisms
===

In chapter 1 we talked about set isomorphisms, which establish an equivalence between two sets. If you remember a set isomorphism is a two-way function between two sets. Or alternatively, you can think of an isomorphism as consisting of two "twin" functions each of which equals identity when composed with the other. 

![Set isomorphism](set_isomorphism.svg)

Then, in chapter 4 we mentioned order isomorphisms, which were like set isomorphisms, but with one extra condition - aside from being there, the function(s) that defines the isomorphism has to be *order-preserving*, so for any two objects **a** and **b**, *a ≤ b** iff **F(a) ≤ F(b)**. 

![Order isomorphism](order_isomorphism.svg)

We can extend this definition to work for categories as well. Unlike orders, categories can have more than one morphism between two objects, so the definition would be a little (but not a lot) more complex: Given two categories, an isomorphism between them is an invertible function between the underlying sets of objects, *and* an invertible function between the morphisms that connect them, which maps each morphism to a morphism with the same signature. 

![Category isomorphism](category_isomorphism.svg)

Although longer, this definition is the same as the one we have for orders - it is just that with orders we don't have to specify which isomorphism corresponds to which (as there can be only one morphism) and so all we have to do is to verify that the corresponding morphisms actually exist (which is taken care of by the added condition). 

So those are categorical isomorphisms. But isomorphisms are actually very rare (the only categorical isomorphism that comes to mind is the Curry-Howard-Lambek isomorphism from the last chapter). If two categories are isomorphic, then they are so similar that it would be more accurately counted as different representations of the same category.

[Category isomorphism squares](category_isomorphism_squares.svg)

More useful than isomorphisms, which are two-way connections between categories, are one-way connections between them, which we will examine next. 

Functors
===

Having seen isomorphisms, which are the equivalent of two-way functions between categories, we can imagine how the equivalent one-way functions would look like, they are called *functors*. And a functor between two categories (let's call them **A** and **B**) consists of one function that maps the *objects* of **A** to the objects of **B** and one function that maps all morphisms of **A** to morphisms of **B**.

![Functor](functor.svg)

Also functors should *preserve identities* i.e. all identity morphisms should be mapped to identity morphisms.

![Functor](functor_identity.svg)

And they should also *preserve composition* i.e. for any two morphisms **f** and **g**, the morphism that corresponds to their composition **F(g f)** in the source category should be the same as the morphism that corresponds to the composition of their counterparts in the target directory **F(g) F(f)**.

![Functor](functor_composition.svg)

And this is all there is to it about functors - simple but powerful idea.

Endofunctors
---

Functors in programming
---

Functors as selections
---

Functors as maps
---
If we take the 

Diagrams
---

Hom functors
---

Natural transformations
===

Limits
===

Representable functors
===
Representable functors are set-valued functors that are isomorphic to the Hom functor

A Hom-functor can always be converted to any set-valued functor (Yoneda lemma). But not the other way around

So a functor is representable when we can convert its values to values of the Hom functor

Yoneda Lemma
===

