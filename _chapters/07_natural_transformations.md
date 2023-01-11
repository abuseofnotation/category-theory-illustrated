---
layout: default
title: Natural transformations
---

Natural transformations 
===

In this chapter, we will introduce the central concept of category theory. It is the concept of a morphism between functors or *natural transformation*. Understanding natural transformations will enable us to define category equality and some other advanced concepts.

Natural transformations are really is the heart of category theory - As a matter of fact, category theory was invented with the purpose of studying natural transformations. The importance of natural transformations is not obvious at first, and so before introducing them I like to talk about the body of knowledge that this heart maintains (I am good with methaphors... in principle.)

Objects are overrated
===

> The world is the collection of facts, not of things.
> Ludwig Wittgenstein

Objects are all around us, both in mathematics and in real life - virtually everything that we see or imagine can be viewed as an object. Because of this, we might be inclined to think that the key to understanding the world is to understand what objects are. And this indeed is a popular idea, you might even say that this is what set theory does - the main (we may say the only) atomic concept in set theory is a concept of a set. When mathematicians say that "everything is a set", they are primarily saying that all objects can be represented by sets (and morphisms can be represented by sets as well.)

However, there is another way to look at things. What is an object, when viewed by itself? Can we study an object in isolation and will there anything left to study about it, once it is detached from its environment? When we think hard about everyday objects we realize that each of them has a specific *function* or functions without which, it would be just a piece of junk, and in many ways it won't be an object at all. And this is even more so for mathematical objects which you cannot even represent in isolation - functions, are key. 

So instead of thinking about objects which just happen to have some morphisms between them, we might take the opposite view and say *that objects are only interesting as sources and targets of morphisms.*

This view is best expressed by category theory and specifically by the notion of *universal properties (limits)* - as we said universal properties define an object *up to a unique isomorphism*. This means that if there are two or more objects that are isomorphic to one another and have exactly the same morphisms to all other objects in the category, then these objects are for all intends and purposes equivalent. 


Equivalence of categories
===

Are you ready to hear about natural transformations? Actually it is my opinion that you are not, so I would like to continue with something else. Let's ask ourselves the same question that we were poundering at the beginning of the previous chapter -  what does it mean for two categories to be equal. This question is even more interesting in the context of the category of categories. We said that categorical isomorphism is somewhat too rigid to accurately capture the concept of equality, as (though it may seem contradictory) in isomorphic categories, *isomorphic objects aren't considered equal*, and so this concept goes against the idea that functions (and not objects) are the primary concept. For example the following two categories are *not* isomorphic. 

![Simple non-isomorphic categories](simple_non_isomorphic_categories.svg)

So, being isomorphic means that two structures are completely the same. A map is isomorphic to an area only it represents the area completely, like if there is a arrow for each route and a point for each intersection.

![Isomorphic categories](isomorphic_categories.svg)

But, like we said, in category theory, we specify most concepts by treating isomorphis objects as equal - this is valid for all definitions that are based on universal properties. Or to extend the map example, suppose, that there are two intersections that are positioned in such a way that for every road that goes to and from one of them, there is an identical road to the other one (maybe the one of these intercection was meant to replace the other one but it wasn't closed.) Then suppose that you have a map which displays these two intercections as one and the same intercection. 

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

The definition betwen the two concepts is small but crucial: categories are isomorphic if there exist an *invertable* functor between them. They are equivalent if they are connected by two *isomorphic functors.*

**Task:** Verify that the categories in the previous example are also equivalent.

We already understand when to categories are equivalent, but to have a proper formal definition of the concept we have to know about functor natural isomorphism, which is a kind of a natural transformation.

Natural transformations
===

The progression that we made so far (morphisms -> functors -> natural transformations) might lure you into thinking that natural transformations are similar to morphisms and functors. They are actually not similar, they are not "recursive", to be more precise: both normal morphisms and functors are morphisms between objects (or *1-morphisms*), but natural transformations are morphisms between morphisms (known as *2-morphisms*.)

But enough talking, let's draw some diagrams. 

We know that natural transformations are morphisms between functors, so let's draw two functors (I am omitting the arrows between the morphisms for brevity.)

![Two functors](natural_functors_objects.svg)

Note that the functors are similar have the same signature - both their input and output categories are the same - this is a necessary (but not sufficient) condition for them to be connected by a natural transformation.

Building the object mapping mapping
---

A functor is comprised of two components - object mapping and morphism mapping, so a natural transformatiom, being a morphism between functors, should take those two mappings into account.

Let's first connect the object mappings of the two functors, creating what we called "object mapping mapping". It is simpler than it sounds when we realize that we only need to connect the object in functors' *target category*. The objects in the source category would just always be the same as both functors would include *all* object from the source category, (because that is what functions do, right?)

In other words, mapping the two functors' object components involves nothing more than specifying a bunch of morphisms in the target category.

![Two functors](natural_transformation.svg)

Note that the mappings between these objects do not (always) have the character of a functor, since not all objects are mapped to other objects.

Building the morphism mapping mapping
---
Once the connections between the object mappings are already established, there is only one way to do the morphism mapping -  take each morphism in the source category and connect the two images that this morphism has (generated by the two functors), in the target category.

![Two functors](natural_functors.svg)

Formal definition 
---

Before we finish up this chapter, let's distill a rigorous definition of natural transformations: For any two functors $F$ and $G$ that both have the same type signature of source category $C$ and a target category $D$ (so $F : C \to D$ and $G : C \to D$), a natural transformation $\alpha : F \Rightarrow G$ is a collection of morphisms between objects in $D$ that maps all target objects of functor $F$ (or the image of $F$ in $D$ as it is also called) to target objects of functor $G$. 

Furthermore, the mapping must be such that any morphism in $C$ with a signature $X \to Y$, the object $F(X)$ in $D$ should always be mapped to $G(X)$ and object $F(Y)$ should be mapped to $G(Y)$.

Note that if the condition above (sometimes called the "naturality condition") is met, the below diagram would commute. This works the other way too - if the diagram commutes, the condition is met, so we can say that *the diagram and the definition are isomorphic*. And because the diagram is much simpler we may think of it as the real definition.

![Two functors](natural_transformation_formula.svg)

If you look just a little bit closely, you will see that the only difference between this diagram and our example is that here morphisms are displayed vertically, while in the example they are horizontal.

Natural transformations again
===

I am sure that once you saw one definition of a natural transformation, you just cannot get enough of them. So let's work out one more. Let's start with our two functors.

![Two functors](natural_functors.svg)

This diagram might prompt us into thinking of natural transformations as some kind of "double functors" that have not one but two arrows coming from each object. This notion, of course, cannot be defined (as we said several times, the whole point of functions is the that there is just one arrow for each object), but a related notion that can be defined is that of *product categories*.

Product categories
---

We already saw products between *groups/monoids*, the product categories are similar: take any two categories (in practice it is good if one of them is a finite one, but any two would work). 

![Product category - components](product_components.svg)

And then take the set of all possible pairs of the objects of these categories.

![Product category - objects](product_set.svg)

Is there a way to make a category from that set? Sure, we saw something similar in the chapter about group/monoid products - we just take all morphisms coming from any of the two categories and replicate them to all pairs that feature some objects from their type signature.

![Product category](product_category.svg)

This is the *product category* of the two categories.

Natural transformations as functors of product categories
---

When looking into the last diagram, you might suspect that the categories we chose to demonstrate the notion of the product category is not arbitrary. And you would be right - we can already see the naturality square in it. 

![Product category](product_category_target_category.svg)

That is because the category with two objects and one morphism (which, if you remember is called $2$) is the key to constructing a functor that is equivalent to a natural transformation - because it has two objects, it produces two copies of the source category and because the two objects are connected, the two copies are connected in the same way as the two "images" in the target category are connected. And so all that is left is to draw the two functors.

![Product category](product_category_natural_transformation.svg)

Formal definition
---
Let's state formally what we saw in these diagrams. As you remember we call our two functors $F$ and $G$ and the our categoris $C$ and $D$ (so $F : C \to D$ and $G : C \to D$). 

Also, we call the category with two connected objects $2$ and the morphisms in it are $0$ and $1$.

In this case, our natural transformation $\alpha : F \Rightarrow G$ is just a functor from the product category of $2$ to $C$ so $2 \times C \to G$, such that if we take the subcategory of $C$ comprised of just those objects that have the $0$ object, and the morphisms between them, then that functor is equivalent to $F$, and if we consider the subcategory that contains $1$, then the functor is equivalent to $G$ (we write $\alpha(-,0)=F$ and $\alpha(-,1)=G$.) Et voilà!

**Task:** See how the two definitions are equivalent.

/*

Natural transformations from surjective functors are just regular functors.


Limits and colimits
====

Interlude: Naturality explained
---

Isomorphism is not hard to construct - given two sets, containing three objects each, there are three isomorphisms that connect them, and that number grows exponentially. 

But most of these isomorphisms, are just random. In our studies we are only interested in structures that *make sense*. In category theory the abstract notion of making sense is captured by the naturality condition.

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

*/
