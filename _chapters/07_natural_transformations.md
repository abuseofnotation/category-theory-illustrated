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

>The world is the collection of facts, not of things.
Ludwig Wittgenstein

Objects are all around us, both in mathematics and in real life - virtually everything that we see or imagine can be viewed as an object. Because of this, we might be inclined to think that the key to understanding the world is to understand what objects are. And this indeed is an idea shared between many people, you might even say that this is what set theory does.

However there is another way to look at things. Because what is an object, when viewed by itself? Can we study just one object in isolation? And is there anything left to study about it, once it is detached from its environment? When we think hard about everyday objects we realize that each of them has a specific *function* or functions without which, it would be just a piece of junk, and in many ways it won't be an object at all. And this is even more so for mathematical objects which you cannot even recycle when they are no longer useful - functions, or relations are key.

So instead of thinking about objects which just happen to have some morphisms between them, we might take the opposite view and say that objects are only interesting as domains and codomains of morphisms.

This view is best expressed by category theory and specifically by the notion of universal properties (limits) - as we said in the previous chapter universal properties define an object *up to a unique isomorphism*. This means that if there are two or more objects that are isomorphic to one another and have exactly the same morphisms to all other objects in the category, then these objects are for all intends and purposes equivalent. 


Equivalence of categories
===

Are you ready to hear about natural transformations? Actually it is my opinion that you are not, so I would like to continue with something else. Let's ask ourselves the same question that we were poundering at the beginning of the previous chapter -  what does it mean for two categories to be equal. 

This question is even more interesting in the context of the category of categories. We said that categorical isomorphism is somewhat too rigid to accurately capture the concept of equality. And the paragraph above can serve as a good summary as to why this is the case: in isomorphic categories, isomorphic *objects* aren't considered equal, for example the following two categories are not isomorphic. 

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

The progression that we made so far (morphisms -> functors -> natural transformations) might lure you into thinking that natural transformations are similar to morphisms and functors, they are actually not similar i.e. they are not "recursive". This is due to the fact that both normal morphisms and functors are morphisms between objects (or *1-morphisms*), while natural transformations are morphisms between morphisms (known as *2-morphisms*.)

But enough talking, let's draw some diagrams. We know that natural transformations are morphisms between functors, so let's draw two functors (I am omitting the arrows between objects for brevity.)

![Two functors](natural_functors_objects.svg)

Note that the functors are similar have the same signature - both their input and output categories are the same - this is a necessary (but not sufficient) condition for them to be connected by a natural transformation.

A functor is comprised of two components - object mapping and morphism mapping. So a natural transformatiom, being a morphism between functors should take those two components into account.

Let's first connect the object mappings of the two functors (we only need to map their targets, because in the source there would always be mapping for all objects.)

![Two functors](natural_transformation.svg)

When trying to establish a connection between the morphism mappings of the two functors, we realize that once the two object mappings are connected, *there is only one correct way to do that* - the one where the two projections (generated by the two functors) of every morphism of the source category are also connected in the target category, by the connection that we just made between the objects in the target category.

So instead of adding a morphism structure, we have to check whether the object structure is correct, by makind sure that morphisms from one projection of the source category, correspond to morphisms in the other projection. Note that in this case the diagram would commute. 

![Two functors](natural_functors.svg)


Furthermore, following this condition is the only way for such a diagram to commute, so, in a very categorical fashion, natural transformations can be defined using diagrams. Here is the standard definition of natural transformation that you would see in most textbooks.

![Two functors](natural_transformation_formula.svg)

If you look just a little bit closely, you will see that the only difference between the two diagrams is that in mine the morphisms are horizontally oriented, and they are shown vertically in the official definition.



Interlude: Naturality explained
---

Isomorphism is not hard to construct - given two sets, containing three objects each, there are three isomorphisms that connect them, and that number grows exponentially. 

But most of these isomorphisms, are just random. In our studies we are only interested in structures that *make sense*. In category theory the abstract notion of making sense is captured by the naturality condition.

Limits and colimits
====


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

