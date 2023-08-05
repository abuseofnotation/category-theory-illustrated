layout: default
title: Natural transformations
---

Natural transformations 
===

> I didn’t invent categories to study functors; I invented them to study natural transformations. --- Saunders Mac Lane

In this chapter, we will introduce the concept of a morphism between functors or *natural transformation*. Understanding natural transformations will enable us to define category equality and some other advanced concepts.

Natural transformations really are at the heart of category theory --- As a matter of fact, category theory was invented with the purpose of studying natural transformations. However, the importance of natural transformations is not obvious at first, and so, before introducing them, I like to talk about the body of knowledge that this heart maintains (I am good with methaphors... in principle).

The categorical way AKA Objects are overrated
===

> The world is the collection of facts, not of things. --- Ludwig Wittgenstein

Some 2500 years ago, the philosopher Parmenides postulated that everything in the universe exists as part of an unchanging nature, and what we see as transformations are merely illusory appearances and so the nature of the universe is permanence. Although far from obviously true, his view is easy to relate to --- objects are all around us, everything we "see", both literary (in real life), or metaphorically (in mathematics), can be viewed as an object. And so we might be inclined to think, that the key to understanding the world is understanding *what objects are*. This is what set theory does, from one standpoint (as well as classical logic) --- the main (we may say the only) atomic concept in set theory is a concept of a set. When mathematicians say that "everything is a set", they are saying that *all objects can be represented by sets*.

However, there is another way to look at things. What is an object, when viewed by itself? Can we study an object in isolation and will there anything left to study about it, once it is detached from its environment? And, as Theseus once asked, if a given object undergoes a process to get all of it's part replaced, is it still the same object?

Asking such questions might lead us to suspect that, although what we *see* when we look at the world are the objects, it's processes or *functions* that are the real key to understanding it. For example, when we think hard about everyday objects we realize that each of them has a specific *function* or functions without which, it would not be itself. Is a lamp that doesn't glow still a lamp? Is there food that is non-edible (or an edible item that isn't food)? And this is even more valid for mathematical objects, which, without the functions that go between them, are not objects at all. In logic, for example, we specify objects using existential quantifiers i.e. we say there exist an object such that so and so. So instead of thinking about objects that just happen to have some morphisms between them, we might take the opposite view and say *that objects are only interesting as sources and targets of morphisms.* 

Although old, (dating back to Parmenides' rival  Heraclitus) this view has been largely unexplored, both in the realm of philosophy, and that of mathematics. But it is deeply engrained in category theory. For example, when we say that a given property defines an object *up to a unique isomorphism* what we mean is exactly this --- that if there are two or more objects that are isomorphic to one another and have exactly the same morphisms from/to all other objects in the category (have the same *functions* in the category), then these objects are, for all intends and purposes, equivalent. And the key to understanding how this works are natural transformations.

So, are you ready to hear about natural transformations? Actually it is my opinion that you are not, so I would like to continue with something else. Let's ask ourselves the same question that we were poundering at the beginning of the previous chapter ---  what does it mean for two categories to be equal. 

Equivalence 
===

In the prev chapter, we talked a lot about how great isomorphisms are and how important they are for category theory, but at the same time we said that *categorical isomorphisms* do not capture the concept of equality.

![Isomorphic categories](isomorphic_categories.svg)

This is simply because (though it may seem contradictory) *isomorphic objects aren't considered equal* according to categorical isomorphisms i.e. a categories that only differ by having some additional isomorphic objects aren't isomorphic themselves 

![Isomorphic categories](equal_categories.svg)

However, these categories they are equivalent.

**Parmenides:** This category surely cannot be equal to the other one --- it has a different amount of objects!

**Heraclitus:** Who cares bro, they are isomorphic.

To understand it better, let's go back to the functor between a given map and the area it represents. In order for this functor to be invertible (and the categories --- isomorphic) the the map should represent the area completely: there should be arrow for each road and a point for each little place.

![Isomorphic categories](isomorphic_map.svg)

Such a map is necessary if your goal is to know about all *places*, however, like we said, when working with category theory, we are interested not in *places*, but in the *routes* that connect them i.e. we focus not on *objects* but on *morphisms*

Suppose, that there are two intersections that are positioned in such a way that there are routes from one and to the other and vice-versa

![Equivalent categories](equivalent_map.svg)

Or suppose, (a better example, since, in reality, all intercections are linked) that you are graphing a process, in which there are two steps that are always preceded by the same steps and are also always succeeded by the same set of steps. Are they really different steps, or just versions of the same step. 

![Equivalent categories](equivalent_process.svg)

and so it is more apt to define equality with a concept that would only require for the objects to be equal *up to a unique isomorphism*. This concept is called **equivalence**. 

Equivalence of orders
---

Now, we will present the definition of order equivalence. But let's start with order isomorphisms first. In the chapter about orders we presented a definition of order isomorphisms that is based on *set* isomorphisms, but, since we know about functors, we will present a new definition, based on functors: 

Given two orders $A$ and $B$, an *order isomorphism* consists of two functors $F: A \to B$ and $G: B \to A$. Furthermore, those two functors should be such that composing them leads us back where we started. More formally, when for all objects $a$ of $A$ and $b$ of $B$ we have $b = F(G(b))$ and $a = G(F(a))$ or alternatively (if we are using the identity morphisms), such that $ ID_{B} = F \circ G$ and $ ID_{A} = G \circ F$.

![isomorphic orders](isomorphic_orders.svg)

The equivalence of orders is the same, except you replace equality with isomorphism:

...such that $ ID_{B} \boldsymbol{\cong} F \circ G$ and $ ID_{A} \boldsymbol{\cong} G \circ F$.

![Equivalent orders](equivalent_orders.svg)

By the way, remember the concept of equivalence classes that we covered in the orders chapter? Turns our that two orders are equivalent precisely when their equivalence classes orders are isomorphic.

![Orders with isomorphic equivalence classes](equivalent_order_classes.svg)

Equivalence of categories
---
Now that we warmed our minds up with order equivalences, we are ready to tackle the little more-complex *categorical equivalences.*


Natural transformations
===

The progression that we made so far (morphisms -> functors -> natural transformations) might lure you into thinking that natural transformations are similar to morphisms and functors, but they are actually not completely similar, they are not "recursive", to be more precise --- both normal morphisms and functors are morphisms between objects (or *1-morphisms*), but natural transformations are morphisms between morphisms (known as *2-morphisms*).

But enough talking, let's draw some diagrams. 

We know that natural transformations are morphisms between functors, so let's draw two functors (I am omitting the arrows between the morphisms for brevity).

![Two functors](natural_functors_objects.svg)

Note that the functors are similar have the same signature --- both their input and output categories are the same --- this is a necessary (but not sufficient) condition for them to be connected by a natural transformation.

Building the object mapping mapping
---

A functor is comprised of two components --- object mapping and morphism mapping, so a natural transformatiom, being a morphism between functors, should take those two mappings into account.

Let's first connect the object mappings of the two functors, creating what we called "object mapping mapping". It is simpler than it sounds when we realize that we only need to connect the object in functors' *target category*. The objects in the source category would just always be the same as both functors would include *all* object from the source category, (because that is what functions do, right?)

In other words, mapping the two functors' object components involves nothing more than specifying a bunch of morphisms in the target category.

![Two functors](natural_transformation.svg)

Note that the mappings between these objects do not (always) have the character of a functor, since not all objects are mapped to other objects.

Building the morphism mapping mapping
---
Once the connections between the object mappings are already established, there is only one way to do the morphism mapping ---  take each morphism in the source category and connect the two images that this morphism has (generated by the two functors), in the target category.

![Two functors](natural_functors.svg)

Formal definition 
---

Before we finish up this chapter, let's distill a rigorous definition of natural transformations: For any two functors $F$ and $G$ that both have the same type signature of source category $C$ and a target category $D$ (so $F : C \to D$ and $G : C \to D$), a natural transformation $\alpha : F \Rightarrow G$ is a collection of morphisms between objects in $D$ that maps all target objects of functor $F$ (or the image of $F$ in $D$ as it is also called) to target objects of functor $G$. 

Furthermore, the mapping must be such that any morphism in $C$ with a signature $X \to Y$, the object $F(X)$ in $D$ should always be mapped to $G(X)$ and object $F(Y)$ should be mapped to $G(Y)$.

Note that if the condition above (sometimes called the "naturality condition") is met, the below diagram would commute. This works the other way too --- if the diagram commutes, the condition is met, so we can say that *the diagram and the definition are isomorphic*. And because the diagram is much simpler we may think of it as the real definition.

![Two functors](natural_transformation_formula.svg)

If you look just a little bit closely, you will see that the only difference between this diagram and our example is that here morphisms are displayed vertically, while in the example they are horizontal.

Natural transformations again
===

Now that we saw the definition of natural transformations, it is time to see the definition of natural transformations (and if you feel that the quality of the humour in this book is deteoriating, that's only because *things are getting serious*).

I am sure that once you saw one definition of a natural transformation, you just cannot get enough of them. So let's work out one more. Let's start with our two functors.

![Two functors](natural_functors.svg)

This diagram might prompt us into thinking of natural transformations as some kind of "double functors" that have not one but two arrows coming from each object. This notion, of course, cannot be defined (as we said several times, the whole point of functions is the that there is just one arrow for each object), but a related notion that can be defined is that of *product categories*.

Product categories
---

We already saw products between *groups/monoids*, the product categories are similar: take any two categories (in practice it is good if one of them is a finite one, but any two would work). 

![Product category - components](product_components.svg)

And then take the set of all possible pairs of the objects of these categories.

![Product category - objects](product_set.svg)

Is there a way to make a category from that set? Sure, we saw something similar in the chapter about group/monoid products --- we just take all morphisms coming from any of the two categories and replicate them to all pairs that feature some objects from their type signature.

![Product category](product_category.svg)

This is the *product category* of the two categories.

Natural transformations as functors of product categories
---

When looking into the last diagram, you might suspect that the categories we chose to demonstrate the notion of the product category is not arbitrary. And you would be right --- we can already see the naturality square in it. 

![Product category](product_category_target_category.svg)

That is because the category with two objects and one morphism (which, if you remember is called $2$) is the key to constructing a functor that is equivalent to a natural transformation --- because it has two objects, it produces two copies of the source category and because the two objects are connected, the two copies are connected in the same way as the two "images" in the target category are connected. And so all that is left is to draw the two functors.

![Product category](product_category_natural_transformation.svg)

Formal definition
---
Let's state formally what we saw in these diagrams. As you remember we call our two functors $F$ and $G$ and the our categoris $C$ and $D$ (so $F : C \to D$ and $G : C \to D$). 

Also, we call the category with two connected objects $2$ and the morphisms in it are $0$ and $1$.

In this case, our natural transformation $\alpha : F \Rightarrow G$ is just a functor from the product category of $2$ to $C$ so $2 \times C \to G$, such that if we take the subcategory of $C$ comprised of just those objects that have the $0$ object, and the morphisms between them, then that functor is equivalent to $F$, and if we consider the subcategory that contains $1$, then the functor is equivalent to $G$ (we write $\alpha(-,0)=F$ and $\alpha(-,1)=G$). Et voilà!

**Task:** See how the two definitions are equivalent.

/*

Natural transformations from surjective functors are just regular functors.


Limits and colimits
====

Interlude: Naturality explained
---

Isomorphism is not hard to construct --- given two sets, containing three objects each, there are three isomorphisms that connect them, and that number grows exponentially. 

But most of these isomorphisms, are just random. In our studies we are only interested in structures that *make sense*. In category theory the abstract notion of making sense is captured by the naturality condition.


Natural transformations and associativity
===

The definition of natural transformation just states that (ab)c = a(bc)


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

*/
