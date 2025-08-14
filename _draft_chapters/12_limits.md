Limits and colimits
===

As you probably notice, natural transformations are so general that the only way to approach them is through reviewing some special cases. 

So far, we covered natural transformations between endofunctors and especially natural transformations involving the *identity functor*.

![Pointed functor](../11_natural_transformations/identity_functor.svg)

e.g. natural transformations from the identity functor to some other functor (which makes the other functor a  *pointed* functor) or *natural isomorphisms* between some composition of two functors and the identity functor, which establishes a category equivalence.

Now, we will talk about natural transformations that involve a *constant functor*.

The constant functor
---

I don't remember if I covered constant functors, but they are easy. For every object in $D$, there is a functor $C 
\to D$ which takes all objects to this object, and all functors to the identity morphism. Easy, right?

Natural transformations between two constant functors
---

A natural transformation between two constant functors is a morphism (and the other way around).

**Task:** Verify that.

Natural transformations involving constant functors.
---

Limits and colimits
====

Products are one example of what is known in category theory as *limits*. A limit is an object that summarizes a structure (also called a diagram) consisting of other objects and morphisms in a way that allows us to retrieve some of it.

A limit also has to be unique in the sense that you cannot have two limit objects for the same structure.

The notion of a limit is strongly related with the notion of a commuting diagrams. This is not obvious when we are examining products because the diagram of products does not have several routes reaching to the same point.

Limits can be defined formally, just like everything else that we examine, but we won't bother to do that here.

Products are Limits
---

OK, we said that limits summarize a structure. What is the structure that a product is summarizing? It is a structure that consists of two objects (sets) that are have no connections between them.
 
![External diagram](../11_natural_transformations/product_part_external.svg)
 
Why is the product unique when it comes to representing the two objects? Because any other object that also represents them is connected to the product through a morphism (this is known as the *universal property* of limits).





Free objects
===


https://math.stackexchange.com/questions/131389/what-are-free-objects

Monads
===


Representable functors
===

A Hom-functor can always be converted to any set-valued functor (Yoneda lemma). But not the other way around

Yoneda Lemma
===


https://www.azimuthproject.org/azimuth/show/Applied+Category+Theory+Course#Course


https://eed3si9n.com/herding-cats/day1.html


https://topology.mitpress.mit.edu/


https://www.math3ma.com/blog/what-is-a-natural-transformation

https://graphicallinearalgebra.net/2015/04/23/makelele-and-linear-algebra/

https://www.math.toronto.edu/gscott/WhatVS.pdf

https://www.youtube.com/playlist?list=PLk-BCMYCWSzW-nPNnw19Y6oQJnvaAcp1I

https://brilliant.org/courses/linear-algebra/linear-equations-5/
 https://www.math3ma.com/blog/what-is-category-theory-anyway
https://people.cs.nott.ac.uk/psztxa/mgs.2025/

