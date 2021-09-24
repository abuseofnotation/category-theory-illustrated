Functors
===

With this chapter, we will change the tactic a bit, (as I am sure you are a bit tired of jumping through different subjects) and we will examine some purely categorical concepts, using the structures that we saw so far as context. We will also generalize some of the concepts that we saw in these structures so they are valid for all categories.

Categories we saw so far
===

We already saw a many different types of categories, like categories that have just one *object* (monoids, groups) and categories that have only one *morphism* between any two objects (preorders, partial orders). 

![Types of categories](category_types.svg)

We also defined a lot of categories, most notably the ones based on logics/programming languages, but also less serious categories, as for example the color-mixing one

![Types of categories](category_types.svg)

We saw that we can make a category out of everything, as for example our city's road system, or a soccer ranglist starring me and my grandmother.

While examining all of this, we also saw the mother of all categories - the category of sets, as well as various *subcategories* to that category, as for example the set inclusion orders. We saw that many other categories are similar to subcategories of the category of sets.

![Set category](category_set.svg)

But how can we utilize the insights that we get from the fact that so many different things are actually one and the same thing in disquise? To do so we must specify ways to connect categories to one another. This is the topic of this chapter.

Categorical Isomorphisms
===

In chapter 1 we talked about set isomorphisms, which establish the equivalence between two sets. If you remember a set isomorphism consisted of two functions between the sets that when composed are equivalent to the identity function. Or more simply put, of one invertible function.

![Set isomorphism](set_isomorphism.svg)


![Set isomorphism](set_isomorphism_invertable.svg)

Then in chapter 4 we mentioned order isomorphisms, which were just set isomorphisms, with the extra condition that not only the objects, but the arrows should be the same, so for any two elements **a** and **b**, *a ≤ b** iff **F(a) ≤ F(b)**. 

![Order isomorphism](order_isomorphism.svg)

It's a little (but not a lot) more complex to extend this definition to work for categories as well. Given two categories, an isomorphism between them is an invertible function between the underlying sets of objects, plus an isomorphism between the morphisms that connect them.

![Category isomorphism](category_isomorphism.svg)

Although longer, this definition is the same that we have for orders - it is just that orders can have at most one morphism between two objects, so it's obvious from the signature which corresponds to which - all we have to do is to verify that the morphisms exist, which is taken care of by the additional condition. 

So those are categorical isomorphisms. But isomorphisms are actually almost useless - honestly, if two categories are isomorphic, then they are so similar that you can hardly see the difference between one and the other. It will be non-essential.

[Category isomorphism squares](category_isomorphism_squares.svg)

Functors
===

Unlike two-way relations between two categories may be established only in a very limited set of cases, the one-way relations are very common.

Functors in programming
===

Functors as maps
===

Diagrams
===

Natural transformations
===

Limits
===
