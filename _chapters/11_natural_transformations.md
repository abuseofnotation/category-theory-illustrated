---
layout: default
title: Natural transformations
---

Natural transformations 
===

> I didn’t invent categories to study functors; I invented them to study natural transformations. --- Saunders Mac Lane

In this chapter, we will introduce the concept of a morphism between functors or *natural transformation*. Understanding natural transformations will enable us to define category equality and some other advanced concepts.

Natural transformations really are at the heart of category theory --- As a matter of fact, category theory was invented with the purpose of studying natural transformations. However, the importance of natural transformations is not obvious at first. So, before introducing them, I like to talk about the body of knowledge that this heart maintains (I am good with metaphors... in principle).

The categorical way AKA Objects are overrated
===

> The world is the collection of facts, not of things. --- Ludwig Wittgenstein

Some 2500 years ago, the philosopher Parmenides postulated that the nature of universe is permanence, and what we see as transformations are merely illusory appearances. Although it is not obviously true, his view is easy to relate to --- objects are all around us, everything we "see", both literary (in real life), or metaphorically (in mathematics), can be viewed as an object. And so we might be inclined to think, that world is objects, persisting through space and time, that the key to understanding the world is understanding *what objects are*. In my opinion, this is what set theory does, to some extend (as well as classical logic) --- the main (we may say the only) atomic concept in set theory is a concept of a set. When mathematicians say that "everything is a set", they are saying that *all objects can be represented by sets*.

However, there is another way to look at things. As what is an object, when viewed by itself? Can we study an object in isolation, and will there anything left to study about it, once it is detached from its environment? And, as Theseus once asked, if a given object undergoes a process to get all of it's part replaced, is it still the same object? 

Asking such questions might lead us to suspect that, although what we *see* when we look at the world are the objects, it's processes or *morphisms* that are the real key to understanding it. For example, when we think hard about everyday objects we realize that each of them has a specific *function* or functions without which, it would not be itself. Is a lamp that doesn't glow still a lamp? Is there food that is non-edible (or an edible item that isn't food)? And this is even more valid for mathematical objects, which, without the functions that go between them, are not objects at all. In logic, for example, we specify objects using existential quantifiers i.e. we say there exist an object such that so and so. So instead of thinking about objects that just happen to have some morphisms between them, we might take the opposite view and say *that objects are only interesting as sources and targets of morphisms.* 

Although old, (dating back to Parmenides' rival  Heraclitus) this view has been largely unexplored, both in the realm of philosophy, and that of mathematics. But it is deeply engrained in category theory. For example, when we say that a given property defines an object *up to a unique isomorphism* what we mean is exactly this --- that if there are two or more objects that are isomorphic to one another and have exactly the same morphisms from/to all other objects in the category (have the same *functions* in the category), then these objects are, for all intends and purposes, equivalent. And the key to understanding how this works are natural transformations.

Isomorphisms and equivalence 
===

So, are you ready to hear about natural transformations? Actually it is my opinion that you are not, so I would like to continue with something else. Let's ask ourselves the same question that we were pondering at the beginning of the previous chapter ---  what does it mean for two categories to be equal. 

In the prev chapter, we talked a lot about how great isomorphisms are and how important they are for defining the concept of equality in category theory, but at the same time we said that *categorical isomorphisms* do not capture the concept of equality of categories.

![Isomorphic categories](isomorphic_categories.svg)

This is simply because (though it may seem contradictory) *isomorphic objects and morphisms aren't considered equal* according to categorical isomorphisms i.e. categories that only differ by having some additional isomorphic objects aren't isomorphic themselves e.g. those categories are not isomorphic.

![Isomorphic categories](equal_categories.svg)

However, they are *equivalent*.

<!--comic
**Parmenides:** This category surely cannot be equal to the other one --- it has a different amount of objects!

**Heraclitus:** Who cares bro, they are isomorphic.
-->

To understand equivalent categories better, let's go back to the functor between a given map and the area it represents. In order for this functor to be invertible (and the categories --- isomorphic) the the map should represent the area completely i.e. there should be arrow for each road and a point for each little place.

![Isomorphic categories](isomorphic_map.svg)

Such a map is necessary if your goal is to know about all *places*, however, like we said, when working with category theory, we are not so interested in *places*, but in the *routes* that connect them i.e. we focus not on *objects* but on *morphisms*.

For example, if there are intersections that are positioned in such a way that there are routes from one and to the other and vice-versa a map may may collapse them into one intersection and still show all routes that exist. 

![Equivalent categories](equivalent_map.svg)

Although these two categories are *not isomorphic*, i.e. going from one of them to the other and back again doesn't lead you to the same object, it would lead you at least to an *isomophic object*. In this case we say that the categories are *equivalent*.

![Equivalent categories](equivalent_map_equivalence.svg)


Equivalence of orders
===

Now we will present a formal definition of order equivalence. But to do that, we need to revise the definition of order isomorphisms. In the chapter about orders, we presented a definition that is based on *set* isomorphisms:

> An order isomorphism is essentially an isomorphism  between the orders' underlying sets (invertible function). However, besides their underlying sets, orders also have the arrows that connect them, so there is one more condition: in order for an invertible function to constitute an order isomorphism it has to *respect those arrows*, in other words it should be *order preserving*. More specifically, applying this function (let's call it $F$) to any two elements in one set ($a$ and $b$) should result in two elements that have the same corresponding order in the other set (so $a ≤ b$ if and only if $F(a) ≤ F(b)$). 

And we also have to attach the definition of set isomorphism (as we have the condition that the underlying sets be isomorphic).

> Two sets $A$ and $B$ are isomorphic (or $A ≅ B$) if there exist functions $f: A \to B$ and its reverse $g: B \to A$, such that $f \circ g = ID_{A}$ and $g \circ f = ID_{A}$.

Needless to say that this definition is suboptimal. But since we know about functors (which, as we said, serve as functions between the orders), we now devise a new, simpler definition. To do that, we just take the the definition of set isomorphism and replace the word "function" with "functor":

> Two *orders* $A$ and $B$ are isomorphic (or $A ≅ B$) if there exist *functors* $f: A \to B$ and its reverse $g: B \to A$, such that $f \circ g = ID_{A}$ and $g \circ f = ID_{A}$.

In other words, the functors must be such that going back and forth again would bring us at the same place.

![isomorphic orders](isomorphic_orders.svg)

**Task:** Show that the two definitions are equivalent.

And, surprisingly (actually not surprising at all when you get the bigger picture), we can get from order *isomorphism* to order *equivalence* in the same way: we only have to replace equality with isomorphism (so, $=$ with $\cong$).

> Two *orders* $A$ and $B$ are equivalent (or $A ≅ B$) if there exist *functors* $f: A \to B$ and its reverse $g: B \to A$, such that $f \circ g \cong ID_{A}$ and $g \circ f \cong ID_{A}$.

Here, going back and forth brings us not necessarily to the same, but to an an *isomorphic* object. 

![Equivalent orders](equivalent_orders.svg)

Order equivalence and equivalence classes
---

By the way, remember the concept of *equivalence classes* that we covered in the chapter about orders? Turns out that this concept is related. To see how, we visualize the equivalence classes of the two equivalent orders that we saw above.

![Orders with isomorphic equivalence classes](equivalent_order_classes.svg)

It turns our that two orders are equivalent precisely when the orders made of their equivalence classes are isomorphic.

**Task**: Prove this.

Equivalence of categories
===

Now that we warmed up our minds up with order equivalences, we are ready to tackle the more complex *categorical equivalences* (similarly to the way we moved from *order functors* to *categorical functors* in the last chapter). And, as with functors, the definition may *look* a lot more complicated from first glance, but it will actually be just an upgrade of the definition that we have for orders.

Why do we need to upgrade the definition? In the context of categories, we can have more than one morphism between any two objects, and so, besides isomorphic objects, we should also have isomorphic *morphisms*. For example, the following two categories are *not* equivalent (the category on the left has just one morphism, but the category on the right has two).

![Non-equivalent categories](unequal_categories.svg)

(This not valid in the context of orders where we have, by definition, just one route between two objects).

This might seem at odds with the idea that a map is equal to its territory when it covers all routes that exist, as in this case both categories we have a route between the two objects, however a route is not just means for going from point A to point B, and a morphism is more than its signature.

So how do we make the definition of equivalence more general, so it applies to all categories? 

Natural transformations
===

The progression that we made so far (morphisms -> functors -> natural transformations) might lure you into thinking that natural transformations are similar to morphisms and functors, but they are actually not completely similar, they are not "recursive", to be more precise --- both normal morphisms and functors are morphisms between objects (or *1-morphisms*), but natural transformations are morphisms between morphisms (known as *2-morphisms*).

But enough talking, let's draw some diagrams. 

We know that natural transformations are morphisms between functors, so let's draw two functors (I am omitting the arrows between the morphisms for brevity).

![Two functors](natural_functors_objects.svg)

Note that the functors are similar have the same signature --- both their input and output categories are the same --- this is a necessary (but not sufficient) condition for them to be connected by a natural transformation.

Building the object mapping mapping
---

A functor is comprised of two components --- object mapping and morphism mapping, so a natural transformation, being a morphism between functors, should take those two mappings into account.

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

Now that we saw the definition of natural transformations, it is time to see the definition of natural transformations (and if you feel that the quality of the humour in this book is deteriorating, that's only because *things are getting serious*).

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
Let's state formally what we saw in these diagrams. As you remember we call our two functors $F$ and $G$ and the our categories $C$ and $D$ (so $F : C \to D$ and $G : C \to D$). 

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



Limits
===

Products are one example of what is known in category theory as *limits*. A limit is an object that summarizes a structure (also called a diagram) consisting of other objects and morphisms in a way that allows us to later retrieve some of it.

A limit also has to be unique in the sense that you cannot have two limit objects for the same structure.

The notion of a limit is strongly related with the notion of a commuting diagrams. This is not obvious when we are examining products because the diagram of products does not have several routes reaching to the same point.

Limits can be defined formally, just like everything else that we examine, but we won't bother to do that here.

Products are Limits
---

OK, we said that limits summarize a structure. What is the structure that a product is summarizing? It is a structure that consists of two objects (sets) that are have no connections between them.
 
![External diagram](product_part_external.svg)
 
Why is the product unique when it comes to representing the two objects? Because any other object that also represents them is connected to the product through a morphism (this is known as the *universal property* of limits).




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
