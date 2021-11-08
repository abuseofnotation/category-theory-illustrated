---
layout: default
title: Natural Transformations
---
Natural transformations and advanced concepts
===

In this chapter, we will introduce the central concept of category theory. It is the concept of a morphism between functors or of *natural transformation*. Understanding natural transformations will enable us to define category equality and some other advanced concepts.

Natural transformations are really is the heart of category theory - As a matter of fact, category theory was invented with the purpose of studying natural transformations. The importance of natural transformations is not obvious at first, and so before introducing them I like to talk about the body of knowledge that this heart maintains (I am good with methaphors... in principle.)

Objects are overrated
===

> The world is the collection of facts, not of things.
> Ludwig Wittgenstein

Objects are all around us, both in mathematics and in real life - virtually everything that we see or imagine can be viewed as an object. Because of this, we might be inclined to think that the key to understanding the world is to understand what objects are. And this indeed is an idea shared between many people, you might even say that this is what set theory does - the main (some say only) concept of set theory is a concept of a set. When mathematicians say that "everything is a set", they are primarily saying that all objects can be represented by sets (although morphisms can be represented by sets as well.)

However there is another way to look at things. Because, what is an object, when viewed by itself? Can we study an object in isolation? And is there anything left to study about it, once it is detached from its environment? When we think hard about everyday objects we realize that each of them has a specific *function* or functions without which, it would be just a piece of junk, and in many ways it won't be an object at all. And this is even more so for mathematical objects which you cannot even repurposed when they are no longer useful - functions, or relations, are key. So instead of thinking about objects which just happen to have some morphisms between them, we might take the opposite view and say that objects are only interesting as sources and targets of morphisms.

This view is best expressed by category theory and specifically by the notion of universal properties (limits) - as we said universal properties define an object *up to a unique isomorphism*. This means that if there are two or more objects that are isomorphic to one another and have exactly the same morphisms to all other objects in the category, then these objects are for all intends and purposes equivalent. 


Equivalence of categories
===

Are you ready to hear about natural transformations? Actually it is my opinion that you are not, so I would like to continue with something else. Let's ask ourselves the same question that we were poundering at the beginning of the previous chapter -  what does it mean for two categories to be equal. This question is even more interesting in the context of the category of categories. We said that categorical isomorphism is somewhat too rigid to accurately capture the concept of equality. And the paragraph above can serve as a good summary as to why this is the case: in isomorphic categories, isomorphic *objects* aren't considered equal, for example the following two categories are not isomorphic. 

![Simple non-isomorphic categories](simple_non_isomorphic_categories.svg)

Being isomorphic means that two structures are completely the same. A map is isomorphic to an area only it represents the area completely, like if there is a arrow for each route and a point for each intersection.

![Isomorphic categories](isomorphic_categories.svg)

But that won't always be what we want. In category theory we specify most concepts by treating isomorphis objects as equal - this is valid for all definitions that are based on universal properties. Or to extend the map example, suppose, that there are two intersections that are positioned in such a way that for every road that goes to and from one of them, there is an identical road to the other one (maybe the one of these intercection was meant to replace the other one but it wasn't closed.) Then suppose that you have a map which displays these two intercections as one and the same intercection. 

![Non-isomorphic categories](non_isomorphic_categories.svg)

Would say that the map is complete? The answer comes down to what would you want to use the map for: if you want the map to accurately represents all the *places* that exist in the area, then it is not accurate. But if you want the map for practical purposes, if you only need it to represents the *routes* in the area, then there is no reason to show two roads that are the same in terms of their input and output. So in other words, when we focus on objects, we would define two categories as equal if there exists an isomorphism between them. But when we focus on morphisms, then it is more apt to define equality with a concept that would only require for the objects to be equal *up to a unique isomorphism*. This concept is called **natural equivalence**.

Consider these two non-isomorphic, but equivalent categories.

![Equivalent categories](equivalent_categories.svg)

There exist only one functor that connects the left one to the right one.

![Equivalent categories, functor F](equivalent_categories_f.svg)

There are two functors that connect the right one to the left one, which are equivalent, let's choose one of them.

![Equivalent categories, functor G](equivalent_categories_g.svg)

And then if we compose them in one direction we get the same object that we started with, same as if the categories were isomorphic. 

![Equivalent categories, functor G F](equivalent_categories_g_f.svg)

And if we compose it in the other direction, we don't get the same object (which means that the categories are not isomorphic) but we do get an object that that is isomorphic to the one we started with. This makes the categories equivalent.

![Equivalent categories, functor G F](equivalent_categories_g_f.svg)

The definition betwen the two concepts is small but crucial: categories are isomorphic if there exist an *invertable* functor between them. They are equivalent if they are connected by two *isomorphic functors.

**Task:** Verify that the categories in the previous example are also equivalent.

We already understand when to categories are equivalent, but to have a proper formal definition of the concept we have to know about functor natural isomorphism, which is a kind of a natural transformation.

Natural transformations
===

The progression that we made so far (morphisms -> functors -> natural transformations) might lure you into thinking that natural transformations are similar to morphisms and functors. They are actually not similar, they are not "recursive", to be more precise: both normal morphisms and functors are morphisms between objects (or *1-morphisms*), but natural transformations are morphisms between morphisms (known as *2-morphisms*.)

But enough talking, let's draw some diagrams. 

We know that natural transformations are morphisms between functors, so let's draw two functors (I am omitting the arrows between objects for brevity.)

![Two functors](natural_functors_objects.svg)

Note that the functors are similar have the same signature - both their input and output categories are the same - this is a necessary (but not sufficient) condition for them to be connected by a natural transformation.

Object mapping mapping
---

A functor is comprised of two components - object mapping and morphism mapping, so a natural transformatiom, being a morphism between functors, should take those two mappings into account.

Let's first connect the object mappings of the two functors, creating what we called "object mapping mapping", but which is actually much simpler than it sounds - we only need to connect the functors' targets, because the sources would always be the same - both functors would include all object from the source category, and so mapping the two functors' object components involves nothing more than specifying a bunch of morphisms in the target category.

![Two functors](natural_transformation.svg)

Note that the mappings between these objects does not have the character of a function, since not all objects are mapped to other objects.

Morphism mapping mapping
---

Next up, we should connect the morphism mappings of the two functors. Here things are even simpler: as with the "object mapping mapping" we have to only worry the morphisms in the target category, that is, we only need to connect all morphisms that are mapped by one functor to morphisms that are mapped by another, but furthermore when we try to establish such connections, we would realize that *there is only one natural way to do it* once the connections between the object mappings are already established. That way is to take each morphism in the source category and to connect the two images that this morphism has (generated by the two functors), in the target category.

![Two functors](natural_functors.svg)

In other words, connecting the morphism mappings of the two functors is redundant - if we have the object mapping, we don't need it (or alternatively, if we have it, we don't need the object mapping.) We draw it just to verify that the object mapping that we specified indeed gives rise to a natural transformation. In this case we have just one morphism, so it is easy to see that it does.

Definition
---

Before we finish up this chapter, let's distill the definition of natural transformations: A natural transformation between two functors **F** and **G**with source category **C** and a target category **D** (both functors have to have the same signature) is a collection of morphisms between objects in **D** that maps all target objects of functor **F** (or the image of **F** in **D** as it is also called) to target objects of functor **G**. 

Furthermore, the mapping must be such that any morphism in **C** with a signature **X -> Y**, the object **F(X)** in **D** should always be mapped to **G(X)** and object **F(Y)** should be mapped to **G(Y)**.

Note that if the condition above (sometimes called the "naturality condition") is met, the below diagram would commute. This works the other way too -  if the diagram commutes, the condition is met, so, in a very categorical fashion, natural transformations can be defined using this diagram. 

![Two functors](natural_transformation_formula.svg)

If you look just a little bit closely, you will see that the only difference between this diagram and our example is that here morphisms are displayed vertically, while in the exam they are horizontal.

Limits and colimits
====

Interlude: Naturality explained
---

Isomorphism is not hard to construct - given two sets, containing three objects each, there are three isomorphisms that connect them, and that number grows exponentially. 

But most of these isomorphisms, are just random. In our studies we are only interested in structures that *make sense*. In category theory the abstract notion of making sense is captured by the naturality condition.



Adjunctions
===

Left adjoints preserve joins and right adjoints preserve meets. 

Monads
===



TODO

Hom functors
===

Representable functors
===

Representable functors are set-valued functors that are isomorphic to the Hom functor

A Hom-functor can always be converted to any set-valued functor (Yoneda lemma). But not the other way around

So a functor is representable when we can convert its values to values of the Hom functor

Yoneda Lemma
===

