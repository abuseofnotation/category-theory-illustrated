Functors
===

With this chapter, we will change the tactic a bit, (as I am sure you are a bit tired of jumping through different subjects), and we will examine some purely categorical concepts, using the structures that we saw so far as context. And we will also generalize some of the concepts that we saw in these structures so they are valid for all categories.

Connecting categories
===
We already saw a lot of different types of categories:

Categories that have just one object (monoids, groups)

Categories that have only one morphism between any two objects (preorders, partial orders)

Categories based on logic (here each collection of assertions forms its own category) and (somewhat related) programming language categories.

We saw the category of sets as well. And related to it are various categories that are subcategories of the category of sets, for example the set inclusion orders, which only consists of sets of a given number of elements.

But how can we utilize the insights that we get from the fact that so many different things are actually one and the same thing in disquise? To do so we must specify ways to connect one category to another. This is the topic of this chapter.

Categorical Isomorphisms
===

In chapter 1 we talked about set isomorphisms, which establish the equivalence between two sets.

![Set isomorphism](set_isomorphism.svg)

Then in chapter 4 we mentioned order isomorphisms, which were just set isomorphisms, with the extra condition that not only the objects, but the arrows should be the same, so for any two elements **a** and **b**, *a ≤ b** iff **F(a) ≤ F(b)**. 

![Order isomorphism](order_isomorphism.svg)

It's a little (but not a lot) more complex to define extend this definition to work for categories as well. Given two categories, an isomorphism between them is an isomorphism between the underlying sets of objects, plus an isomorphism between the morphisms that connect them.

![Category isomorphism](category_isomorphism.svg)

Although longer, this definition is the same that we have for orders - it is just that orders can have at most one morphism between two objects, so it's obvious from the signature which corresponds to which - all we have to do is to verify that the morphisms exist, which is taken care of by the additional condition. 

So those are categorical isomorphisms. But isomorphisms are actually almost useless - honestly, if two categories are isomorphic, then they are so similar that you can hardly see the difference between one and the other. It will be non-essential.

[Category isomorphism squares](category_isomorphism_squares.svg)

Functors
===

Unlike two-way relations between two categories may be established only in a very limited set of cases, the one-way relations are very common.


The list functor
---

Diagrams
---



Natural transformations
===

Limits
===
