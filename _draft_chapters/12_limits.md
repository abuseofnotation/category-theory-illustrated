# Universal properties

OK, we covered natural transformations, so where to from now? To more advanced stuff, of course! In particular, we will look into one of the concept which is defined using natural transformations, the concept of a universal object/universal property.


## What are universal objects 

In the past chapters we learned about various categorical objects that we didn't define formally: products, the free monoid, the homomorphism object(AKA lambda object)... all of these objects had some contrived definitions that involved arrows "imposter" objects and mysterious universal properties. 

Now, we will see that all of those objects are defined in the same way --- they are all *universal* objects.

Before we talk about all these concepts, we need to explain what do we mean by "universal" objects. To do that, we will reexamine the concepts of terminal and initial object that we studied before.

{: .definition}

> In a given category, the terminal object (denoted $0$) is one such that there exist a unique morphism from it to any other object. 

And also the dual concept of *initial* object:

{: .definition}
> In a given category, the initial object ($1$) is one such that there exist a unique morphism from any other object to it.

In the category of sets, the terminal object is the *singleton* set and the initial object is the *empty* set.

In the category of logics, the terminal object is the *True* and the initial object is *False*.

Now, once we cleared that, defining universal objects is easy:

{: .definition}

An object is universal if it's either initial or terminal.

So far so good, the question is in which category (let's go).

## Products

Let's start with products.


## Universal properties 
Universal properties in #categorytheory are a very simple concept, which is formalized in a very complex manner. 

Roughly,  it's just a situation where every path that leads to a an object A' must go through object A first (or more precisely,  that there is a unique way for it to go through A).

- e.g. any path that goes to objects X and Y, must go through their product XxY.
- e.g. any path that goes from a set S to the underlying set of a group G, must go through F(S), the free group of S

(These are initial universal properties, there are also terminal universal properties, which are dual)



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









