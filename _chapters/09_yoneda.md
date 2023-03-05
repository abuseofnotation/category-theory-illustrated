Yoneda lemma
===

When thinking about some mathematical objects such as a groups, orders or categories, we often feel a need to get to the souce. We start asking ourselves what is "groupness" or "orderness". Like, given some (or any) set of objects, what is the ultimate group that we can create out of these objects - a group that includes all other groups, group such that all other groups are just a special case of it. Or the ultimate order? The ultimate category? 


Homomorphism functors
---

Given any category, we can generate the set of the sets of all morphisms that have a specific type signature with respect to a given object from that category. This is called the *Homomorphism set*, denoted $Hom(B, - )$, $B$ being the object that you picked (for example, let's pick the brown ball.)

![Homomorphism set](hom_set.svg)

This set forms a category where the morphism sets are the objects (again morphism sets are *objects*) and the morphisms are the same as in the original category. And between those two categories (the original and the weird morphism-based one) there is a functor, called the homomorphism functor.

![Homomorphism set](hom_functor.svg)

**Question:** Which object should we pick so that the original and the homomorphism categories are isomorphic? 

With the homomorphism functors, we can *represent* any category in the category of sets. This is why homomorphism functors and all functors that are isomorphic to them are called *representable* functors.

