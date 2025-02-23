---
layout: default
title: Natural transformations
---

Natural transformations 
===

> I didn’t invent categories to study functors; I invented them to study natural transformations. --- Saunders Mac Lane

In this chapter, we will introduce the concept of a morphism between functors or *natural transformation*. Understanding natural transformations will enable us to define category equality and some other advanced concepts.

Natural transformations really are at the heart of category theory, however, their importance is not obvious at first. So, before introducing them, I like to talk about once more of the body of knowledge that this heart maintains (I am good with metaphors... in principle).

So, are you ready to hear about natural transformations? Actually it is my opinion that you are not (no offence, they are just very hard). So, we will take the longer route. 

I can put this next section anywhere in this book, and it would always be neither here nor there. But anyway, if you are studying math, you are probably interested in the *nature of the universe*. "What is the quintessential characteristic of all things in this world?" I hear you ask...

Objects are overrated AKA Heraclitus was right!
===

> The world is the collection of facts, not of things. --- Ludwig Wittgenstein

Some 2500 years ago, the philosopher Parmenides gave an answer to this question, postulating that the nature of universe is permanence, stasis. That what we see as transformations are merely illusory appearances ("Whatever is is, and what is not cannot be"). He said that that things never really change, they only *appear* to change, or (another way to put it), only appearances change, but the *essence* does not (I think this is pretty how the world "essence" came to exist).

Although far from obviously true, his view is easy for people to relate to --- objects are all around us, everything we "see", both literary (in real life), or metaphorically (in mathematics and other disciplines), can be viewed as *objects*, persisting through space and time. If we subscribe to this view, then we would think that the key to understanding the world is understanding *what objects those are*. This is what set theory does, to some extend, in my opinion, as well as classical logic (Plato was influenced by Parmenides when he created his theory of forms).

However, there is another way to approach the question about the nature of the universe, which is equally compelling. Because, what is an object, when viewed by itself? Can we study an object in isolation? And will there anything left to study about it, once it is detached from its environment? If a given object undergoes a process to get all of it's part replaced, is it still the same object? 

Asking such questions might lead us to suspect that, although what we *see* when we look at the universe are the objects, it is the processes or *morphisms* that are the real key to understanding it. For example, when we think hard about everyday objects we realize that each of them has a specific *functions* (note the term) without which, a thing would not be itself e.g. is a lamp that doesn't glow, still a lamp? Is there food that is non-edible (or an edible item that isn't food)? And this is even more valid for mathematical objects, which, without the functions that go between them, are not objects at all.So, instead of thinking about objects that just happen to have some morphisms between them, we might take the opposite view and say *that objects are only interesting as sources and targets of morphisms.* 

Although old, dating back to Parmenides' alleged rival Heraclitus, this view has been largely unexplored... until the 20th century, when a real mathematical revolution happened: Bertrand Russell's type theory, the little book from his student Ludwig Wittgenstein from which the above quote comes from, and which was admired by a circle of mathematicians and logicians, known as the "Vienna circle" (part of which was Rudolph Carnap who we encountered) etc. 

Equivalent categories
===

Isomorphism invariance
---

An embodiment of Heraclitus' view in the realm of category theory is concept of *isomorphism invariance* that we implicitly touched several times. All categorical constructions that we covered (products/coproducts, initial/terminal objects, functional objects in logic) are isomorphism-invariant, or, equivalently, they define an objects *up to an isomorphism*. This means that if there are two or more objects that are isomorphic to one another, and one of them has a given property, then the rest of them have to have this property as well. 

In short, in category theory **isomorphism = equality**.

The key to understanding category theory lies in understanding isomorphism invariance. And the key to understanding how isomorphism invariance works are natural transformations.

Categorical isomorphisms are *not* isomorphism-invariant
---

Let's ask ourselves the same question that we were pondering at the beginning of the previous chapter --- what does it mean for two categories to be equal. 

In the prev chapter, we talked a lot about how great isomorphisms are and how important they are for defining the concept of equality in category theory, but at the same time we said that *categorical isomorphisms* do not capture the concept of equality of categories.

![Isomorphic categories](isomorphic_categories.svg)

This is simply because (though it may seem contradictory) *categorical isomorphisms aren't isomorphism invariant*, i.e. categories that only differ by having some additional isomorphic objects aren't isomorphic themselves.

![Isomorphic categories](equal_categories.svg)

However, they are *equivalent*.

<!--comic
**Parmenides:** This category surely cannot be equal to the other one --- it has a different amount of objects!

**Heraclitus:** Who cares bro, they are isomorphic.
-->

Equivalences are isomorphism invariant
---

To understand equivalent categories better, let's go back to the functor between a given map and the area it represents (we will only consider the thin categories (AKA orders) for now). In order for this functor to be invertible (and the categories --- isomorphic) the the map should represent the area completely i.e. there should be arrow for each road and a point for each little place.

![Isomorphic categories](isomorphic_map.svg)

Such a map is necessary if your goal is to know about all *places*, however, like we said, when working with category theory, we are not so interested in *places*, but in the *routes* that connect them i.e. we focus not on *objects* but on *morphisms*.

For example, if there are intersections that are positioned in such a way that there are routes from one and to the other and vice-versa a map may may collapse them into one intersection and still show all routes that exist. 

![Equivalent categories](equivalent_map.svg)

Although these two orders are *not isomorphic*, i.e. going from one of them to the other and back again doesn't lead you to the same object, it would lead you at least to an *isomophic object*. 

![Equivalent categories](equivalent_map_equivalence.svg)

In this case we say that the orders are *equivalent*.

Defining equivalence in terms of objects
---

As we said, two orders are equivalent when going from one of them to the other and back again leads you to an object that is *isomorphic* to the one you started with. 

![Equivalent orders](equivalent_orders.svg)

But when does this happen? To understand this, we plot the orders as a Hasse diagram.

![Equivalent orders](equivalent_orders_hasse.svg)

You can see that all objects at a given *level* of the left order are connected to the corresponding level of the right one.

Remember the concept of *equivalence classes* that we covered in the chapter about orders? Turns out that this concept is related to order equivalences. To see how, we visualize the equivalence classes of the two equivalent orders that we saw above.

![Orders with isomorphic equivalence classes](equivalent_order_classes.svg)

You can see that they are isomorphic. And that is no coincidence: two orders are equivalent precisely when the orders made of their equivalence classes are isomorphic.

Unfortunately, this is not true for all categories. we can have more than one morphism between any two objects, and so, besides isomorphic *objects*, categories should also have isomorphic *morphisms* to be equivalent. 

For example, the following two categories are *not* equivalent, although their equivalence classes would be isomorphic (the category on the left has just one morphism, but the category on the right has two).

![Non-equivalent categories](unequal_categories.svg)

This is because when we are working with orders, we can get away by just thinking about *objects* but the categorical way demands us to think about morphisms.


Defining equivalence in terms of objects
---

In the chapter about orders, we presented a definition of order isomorphisms, that is based on *objects*:

> An order isomorphism is essentially an isomorphism  between the orders' underlying sets (invertible function). However, besides their underlying sets, orders also have the arrows that connect them, so there is one more condition: in order for an invertible function to constitute an order isomorphism it has to *respect those arrows*, in other words it should be *order preserving*. More specifically, applying this function (let's call it $F$) to any two elements in one set ($a$ and $b$) should result in two elements that have the same corresponding order in the other set (so $a ≤ b$ if and only if $F(a) ≤ F(b)$). 

That a way to define them, but it is not the best way. Now that we know about functors (which, as we said, serve as functions between the orders and other categories), we can devise a new, simpler definition, which would also be valid for all categories, not just orders, and also would be valid for all forms of equality (isomorphism and equivalence).

![isomorphic orders](isomorphic_orders.svg)

We begin with the definition of **set isomorphism**:

> Two sets $A$ and $B$ are isomorphic (or $A ≅ B$) if there exist functions $f: A \to B$ and its reverse $g: B \to A$, such that $f \circ g = ID_{A}$ and $g \circ f = ID_{A}$.

To amend it so it is valid for all categories  by just replacing the word "function" with "functor" and "set" with "category":

> Two *categories* $A$ and $B$ are isomorphic (or $A \cong B$) if there exist *functors* $f: A \to B$ and its reverse $g: B \to A$, such that $f \circ g = ID_{A}$ and $g \circ f = ID_{A}$.

**Task:** Show that the two definitions are equivalent.

Believe it or not, this definition, is just one find-and-replace operation away from the definition of *equivalence*. We get there only by replace equality with isomorphism (so, $=$ with $\cong$). And, of course, instead of $A \cong B$ (isomorphism), we have $A \simeq B$ (equivalence).

> Two *categories* $A$ and $B$ are equivalent (or $A \simeq B$) if there exist *functors* $f: A \to B$ and its reverse $g: B \to A$, such that $f \circ g \cong ID_{A}$ and $g \circ f \cong ID_{A}$.

Comparing the formulas is enough to grasp both the similarities and the difference between isomorphism and equivalence that we already listed: with isomorphisms, going back and forth brings us to the same object, while with equivalence the object is just *isomorphic* to the original one. 


This is truly all there is to it. 

There is only one problem --- *we never said what it means for functors to be isomorphic*.

Natural transformations, natural isomorphisms and categorical equivalence
===

So, how can we make the above definition "come to life"? The title of this chapter outlines the steps we need to take:

1. *Morphisms between functors* (*natural transformations*).
2. *Functor isomorphism* (*natural isomorphism*). 
3. Finally *categorical equivalences*.

If this sounds hard for you, remember that we are doing the same thing we always did --- talking about isomorphisms, in the very first chapter of this book, we introduced *set isomorphisms*, which are quite easy, and now we reached the point to examine *functor isomorphisms*. So, we are doing the same thing. 

<!--comic-->
Although actually...

Actually, natural transformations are actually quite different from morphisms and functors, (the definition is not "recursive") --- both normal morphisms and functors are morphisms between objects (or *1-morphisms*), but natural transformations are *morphisms between morphisms* (known as *2-morphisms*).

But enough talking, let's draw some diagrams. 

We know that natural transformations are morphisms between functors, so let's draw two functors. 

![Two functors](natural_functors_objects.svg)

The functors have the same signature. Naturally, how else would we have morphisms between them? 

Now, a functor is comprised of two mappings (object mapping and morphism mapping) so a mapping between functors, would consist of "object mapping mapping" and "morphism mapping mapping".

Object mapping mapping
---

Let's first connect the object mappings of the two functors, creating what we called "object mapping mapping". It is simpler than it sounds when we realize that we only need to connect the object in functors' *target category*. The objects in the source category would just always be the same as both functors would include *all* object from the source category, (because that is what functions do, right?) In other words, mapping the two functors' object components involves nothing more than specifying a bunch of morphisms in the target category: one morphism for each object in the source category (so for example, our current source category has two objects and we specify two morphisms).

![Two functors and a natural transformation](natural_transformation.svg)

Note that, althought it looks like a function, this mappings does not (always) constitute a function, since not all objects have arrows coming from them (e.g. here the black and blue square do not have such).

**Question:** When exactly would the mapping be a real function?

Morphism mapping mapping
---

The morphism part might seem hard... until we realize that, once the connections between the object mappings are already established, there is only one way to connect the morphisms --- we take each morphism of the source category and connect the two morphisms given by the two functors, in the target category. And that's all there is to it. 

![Two functors](natural_functors.svg)

Oh, actually, there is also this condition that the above diagram should commute (the naturality condition), but that happens pretty much automatically.

The naturality condition
---

So, just like anything else in category theory, natural transformations have some laws that they are required to pass, but in this case it's one law --- the naturality condition. 

To we state this law, let's recap where are we now: we have two functors $F$ and $G$ that both have the same type signature (so $F : C \to D$ and $G : C \to D$ for some categories $C$ and $D$), a family of morphisms in the target directory $D$ (denoted $\alpha : F \Rightarrow G$) one for each object in $C$, that are mapping each target object of functor $F$ (or the image of $F$ in $D$ as it is also called) to some target objects of functor $G$. This is a *transformation*, but not necessarily a *natural* one. A transformation is natural, this diagram should commutes for all morphisms in $C$.

![Two functors and a natural transformation](natural_transformation.svg)

i.e. a transformation is natural when every morphism $f$ in $C$ is mapped to morphism $F(f)$ by $F$ and to $G(f)$ by $G$ (not very imaginative names, I know), in such a way, that we have $\alpha \circ F(f) = G(f) \circ \alpha$ i.e. when starting from the white square, going right and then down (via the yellow square) would be equivalent to going down and then right (via the black one).

I am sorry, what were we talking again. Oh yeah --- categorical equivalence. Remember that categorical equivalence is the reason why we natural transformations and isomorphisms? Or perhaps it's the other way around. Nevermind.

Natural isomorphisms 
---

After understanding natural transformations, natural isomorphisms, are a non-brainer. 

Think about it this way: if a natural transformation is just a family of morphisms in a given category that satisfy certain (aguably pretty complex) criteria, then what would a natural *isomorphism* be? That's right --- it is a family of *isomorphisms* that satisfy the same criteria.

![Two functors and a natural transformation](natural_isomorphism.svg)

That's right the diagram is the same as the one for ordinary natural transformation, except that $\alpha$ are not just ordinary morphisms, but isomorphisms.

And the turning those morphisms into isomorphisms makes the diagram commute in more than one way i.e. if we have the naturality condition 

$\alpha \circ F(f) = G(f) \circ \alpha$ i.e. the two paths going from **white** to **blue** are equivalent.

We also have:

$F(f) \circ  \alpha  =   \alpha  \circ G(f)$ i.e. the two paths going from **black** to **yellow** are also equivalent.

Constructing categorical equivalences
---


Natural transformations in the list functor. Some thoughts on naturality
===

Before we continue, let's talk about this elusive the naturality condition. Before, we said that we shouldn't worry too much about it, as it is satisfied every time. Statistically, however, this is not true --- as far as I am concerned, about 99.999 percent of transformations aren't really natural (I wonder if you can compute that percentage properly?). But at the same time, it just so happens (my favoure phrase when writing about maths) that all transformations that we care about *are* natural.

Natural transformations between the list functor
---

Now, suppose this sounds a bit vague. If only we had some example of a natural transformation that I can use... But wait, we do have one! In the previous chapter, we showed a natural transformation when we talked about what pointed functors are.

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
