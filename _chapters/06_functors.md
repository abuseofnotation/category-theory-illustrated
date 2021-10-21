---
layout: default
title: Functors
---

Functors 
===

This chapter we will change the tactic a bit (as I am sure you are a bit tired of jumping through different subjects) and we will examine some purely categorical concepts, using the structures that we saw so far as context. We will also generalize some of the concepts that we saw in these structures so they are valid for all categories.

Categories we saw so far
===

So far we saw many different categories and category types:

Set
---

We saw the mother of all categories - *the category of sets* and we learned that there are many other categories that are based on it, such as the category of types in a programming languages.

Category types
---

We learned that they are special types of categories, like categories that have just one *object* (monoids, groups) and categories that have only one *morphism* between any two objects (preorders, partial orders). 

![Types of categories](category_types.svg)

Other categories
---

We also defined a lot of *categories based on different things*, like the ones based on logics/programming languages, but also less "serious ones", as for example the color-mixing one. 

![Category of colors](category_color_mixing.svg)

Finite categories
---

And most importantly, we saw some categories that are *completely made up and have no value whatsoever*, such as my made-up soccer hierarchy. We call those *finite categories*. 

Although few finite categories are useful by themselves, *the concept of finite categories* is very important - we can draw any combination of points and arrows and call it a category, in the same way that we can construct a set out of everything.

![Finite categories](finite_categories.svg)

For future reference, let's see some basic finite categories.

Categorical Isomorphisms
===

Many of the categories we saw have similarities between one another, as for example both the color-mixing order and categories that represent logic have greatest and least objects. To pinpoint such similarities and understand what they mean, we specify formal ways to connect categories to one another. In chapter 1 we talked about set isomorphisms, which establish an equivalence between two sets. If you remember a set isomorphism is a *two-way function* between two sets or, alternatively, two "twin" functions each of which equals identity when composed with the other. 

![Set isomorphism](set_isomorphism.svg)

Then, in chapter 4, we mentioned order isomorphisms and saw that they are the same thing as set isomorphisms, but with one extra condition - aside from being there, the functions that define the isomorphism have to preserve the order of the elements i.e. all elements have to have the same arrows pointing to and from them. Or more formally put: **a** and **b**, **a ≤ b** iff **F(a) ≤ F(b)**. 

![Order isomorphism](order_isomorphism.svg)

We can extend this definition to work for categories as well. However, unlike orders, categories can have more than one morphism between two objects, so the definition is a little more complex. It is the following: given two categories, an isomorphism between them is an invertible function between the underlying sets of objects, *and* an invertible function between the morphisms that connect them, which maps each morphism to a morphism with the same signature. If you haven't seen the word, the "signature" of a function is just its input and output, so two functions have the same signature if they have the same input and output.

![Category isomorphism](category_isomorphism.svg)

Although a little more complex, this definition is the same as the one we have for orders - it is just that with categories we can have more than one morphism between two objects and so we need to explicitly specify which one corresponds to which, while in order theory we only need to verify that the corresponding morphism actually exist (for orders is done by the *order-preserving* condition.)

So those are categorical isomorphisms. But isomorphisms are actually very rare. The only one that comes to mind is the Curry-Howard-Lambek isomorphism from the last chapter. If two categories are isomorphic they basically contain the same data and it would be more accurate to refer to them as different representations of the same category, then as separate categories.

<!--
comics:
OK, I think I got it - isomorphisms are when you have two similar pictures and you connect the dots.

Pretty much.
-->

What are functors
===

Much more abundant than isomorphisms, which are two-way connections between categories, are one-way connections between categories, which we will examine next. As you might have guessed, those are called functors.

They are more abundant than isomorphisms because each isomorphism is also a functor (actually two functors).

*Functors* work like this - a functor between two categories (let's call them **A** and **B**) consists of a mapping that maps each *object* in **A** to an object in **B** and a mapping that maps each *morphism* between objects in **A** to a function of **B** in a way that preserves the structure of the category.

![Functor](functor.svg)

Let's go through each component of this definition.

Object mapping
---

Firstly, we have a mappings between the categories' objects. These are just regular old functions, so the definition from chapter 1 applies here.

> A function is a relationship between two sets which matches each element of one set, called the *domain* of the function, with exactly one element from another set, called the converse domain, or the *codomain* of the function.

Formally, this component of the functor can be defined as a function between the categories' *underlying sets*.

![Functor for objects](functor_objects.svg)

Morphism mapping
---

The other component of a functor is a mapping between morphisms. Intuitively, we can think of it as just a regular function as well, but with the added requirement that it preserves the morphism's domain and codomain.

![Functor for morphisms](functor_morphisms.svg)

A more rigorous definition of a morphism function involves the concept of the *homomorphism set* - this is a set that contains all morphisms that go between given two objects in a given category as its elements. Utilizing this concept, we can say that a function between the morphisms of the two categories is actually a collection of the functions between their respective homomorphism sets.

![Functor for morphisms](functor_morphisms_formal.svg)

Note how the concepts of "homomorphism set" and of "underlying set" allowed us to "escape" to set theory when defining categorical concepts. We will see more of this.

Functor laws
---

So these are the two components that form a functor. But aside from defining them we should verify that they preserve the structure of the source category into the target. What is the structure of a category? As stated in the category definition in chapter 2:

> A category is a collection of **objects** (we can think of them as points) and **morphisms** (arrows) that go from one object to another, where:
> 1. Each object has to have the identity morphism.
> 2. There should be a way to compose two morphisms with an appropriate type signature into a third one in a way that is associative.

So this requirement translates to the following two laws, which are called the *functor laws*

1 Functions between morphisms should *preserve identities* i.e. all identity morphisms should be mapped to other identity morphisms.

![Functor](functor_laws_identity.svg)

2 They should also *preserve composition* i.e. for any two morphisms **f** and **g**, the morphism that corresponds to their composition **F(g f)** in the source category should be the same as the morphism that corresponds to the composition of their counterparts in the target directory, so **F(g) F(f)**.

![Functor](functor_laws_composition.svg)

And this is all there is to it about functors - a simple but, as we will see shortly, very powerful idea.

Diagrams as functors
===

Let's start with one that is very meta. Consider a diagram, any diagram from this book. By definition diagrams are, or aim to be, some kind of description of reality, so in order to understand them we have to relate them to some structure, be it a real-world situation or a mathematical structure - we have to associate each object from the diagram with an object from the external world, and also each morphism from the diagram with some kind of relationship that our objects have. But diagrams are just finite categories. So when we are perceiving a diagram, we are actually creating a functor in our heads, we might even say that the functor is perception itself.

For example, if we consider the preorder representing different cities and the roads in a given region. 

![Preorder of city pathways](city_preorder.svg)

A diagram that represents that order is actually just a map of the region where the cities are located.

![A map and a preorder of city pathways](city_preorder_functor.svg)

Knowing that the lines on the map represent the roads that connect different points in the city allows you to find your way around, even if there are no labels.

Object mapping
---

We already have a pretty good intuition for the functor between a diagram and a set of real-world object, but let's try to describe it in detail. The first component of this functor is the mapping from the objects in the diagram to real-world objects. In the case of maps, this is done by the author of the map, but also by the person who uses it, who, when seeing a given place in the map and the corresponding place in real-life, makes a mental connection between the two, based on the map labels.

Morphism mapping
---

The real value of most diagrams lies in the morphisms, so all morphisms in it have to correspond to real-life morphisms between the objects it represents. Notice that in order to be a functor, the map should not represent *all* relations that these objects have, as for example a map does not have to list all roads that exist in real life - the only requirement is that *the roads listed be actual* - this is valid for all other functors as well.

Functor laws
---

In diagrams, identities and morphisms that are a result of composition are usually not displayed, but their existence is implied. Furthermore if the diagram commutes, then there is only *one morphism* between any two objects that are connected (even if they are connected in more than one way). Because of this, functor laws in functors between diagrams and other categories are always followed i.e. the morphisms in the map and the morphisms between the actual objects compose in the same way.

In a map, this means that all roads that come from and to a given place are connected with one another

Functors in programming
===

Before we think about how functors work in programmers, let's try to answer the million-dollar question: "How are functors *useful*?" (sometimes formulated also as "Why are you wasting my/your time with this?") Earlier we saw that *maps are functors* and we know that *maps are useful*, so let's start from them:

What makes a map or any other kind of diagram useful? Well, obviously, it is because the points and arrows in the map corresponds to the cities and the roads in the place you are in i.e. because of the very fact that it is a functor, but there is a second aspect as well: *diagrams are simpler to work with than actual thing they are representing i.e.* it is much easier to go through all routes between two given places by following a map than to actually drive through all these routes in real life. 

![Routing using a map in the preorder of city pathways](city_preorder_map.svg)

It the same point is valid also for programming: a functor from a simple type (like `string`, `number` etc) to a more complex one (like `Array` and `Map`) allows you to work from the context of the simpler type while actually performing operations on the more complex one.

Because they are simpler, maps don't include *all* roads and *all* traveling options. And the same is true for functors in programming - having a functor doesn't allow you to do define *all* operations using only the simple type, only some of them (some are better than nothing, right?) 

To see how this works, let's revisit the general functor definition in the context of programming (by just changing the terms we used, according to the table in chapter 2.)

> A functor between two categories (let's call them **A** and **B**) consists of a mapping that maps each *type* in **A** to a type in **B** and a mapping that maps each *function* between types in **A** to a function between types in **B** in a way that preserves the structure of the category.

Note that all programming language types are actually in one category so all the functors used in programming are *endofunctors* (ones in which the input and output category is one and the same), but that doesn't make any difference in terms of this definition (you can also think of them as belonging to different categories if that's easier for you.)

Type mapping
---

The first component of a functor is a mapping that converts one type (let's call it **A**) to another type (**B**). So it is *like a function, but between types*. Such constructions are supported by almost all programming languages that have static type checing in the first place - they go by the name of *generic types* and if you think about it, a generic type is just a function that takes one concrete type as an argument and returns another one , for example the type `Array<A>` maps the type `String` to `Array<String>`, the type `Number` to `Array<Number>` etc. 


Function mapping
---

So the type mapping of a functor can correspond to a generic type in a programming language (we can also have functors between two generic types, but we will review those later.) However the nontrivial part of the functor is the *function mapping* - that is a mapping that convert any function of simple types, like `String -> Number` to a function between their more complex counterparts e.g. `Array<String> -> Array<Number>`. 

In programming languages, this mapping is represented by a higher-order function called `map` with a signature `(a -> b) -> (Fa -> Fb)` (where `F` represents the composite type.)

Any function with that type signature gives rise to a functor, but not all such functors are useful. In practice, usually, there is only one of them that makes sense for a given generic type. For example, in the case of arrays and similar structures, `map` is a function that applies the original function (the one that converts simple types) to all elements of the structure. 

Because only one `map` function per generic type works (and for simple convenience) you might sometimes see `map` defined directly in the datatype as a method. Here is how it might look in TypeScript, where it is implemented in the way that I described above:

```
class Array<A> {
  map (f: A -> B): Array<B> {
    let result = [];
    for (obj of this) {
      result.push(f(obj));
    }
    return result;
  }
}
```

Why is `map` useful? If we think about the category of simple types, there are numerous functions between those types, like, as we said before, there are a myriad functions that convert strings to numbers.

For a lists, there aren't that many functions. But there also doesn't need to be that many of them, as with map we can use every function that convert strings to numbers to convert string arrays to number arrays.

Functor laws
---

Aside from facilitating code reuse by bringing in all standard functions of simple types in a more complex context, `map` allows us to work in a way that is predictable, courtesy of the functor laws, which in programming context look like this.

```
a.map((a => a) == a

const compose = (f, g) => f(g)
a.map(f).map(g) == a.map(compose(g, f))
```

Free and forgetful functors
===

The category of categories 
===

I got you this time, didn't I? You probably thought that I won't introduce another category in this chapter, but this is exactly what I am going to do. And another surprise is that the new category won't be the category of functors (don't worry, we will introduce that in the next chapter.) 

Instead, we will examine the category of small categories (we say *small* because otherwise the category will include itself and it's going to be Russell's paradox all over again.) This category has all the categories that we saw so far as objects and functors are its morphisms. 

**Task:** go through the functor definition and see how you can make functors compose. 

**Question:** What are the initial and terminal object of the category of small categories.

There isn't much to say about this category, it is just a good exercise to try to visualize it.

[The category of categories](category_of_categories)

Recursiveness of Cat
---

But how can one and the same object appear in so many places in different roles? 

Interlude: objects are overrated
---

>The world is the collection of facts, not of things.
Ludwig Wittgenstein

Objects are all around us, both in mathematics and in real life - virtually everything that we see or imagine can be viewed as an object. Because of this, we might be inclined to think that the key to understanding the world is to understand what objects are. And this indeed is an idea shared between many people, you might even say that this is what set theory does.

However there is another way to look at things. Because what is an object, when viewed by itself? Can we study just one object in isolation? And is there anything left to study about it, once it is detached from its environment? When we think hard about everyday objects we realize that each of them has a specific *function* or functions without which, it would be just a piece of junk, and in many ways it won't be an object at all. And this is even more so for mathematical objects which you cannot even recycle when they are no longer useful - functions, or relations are key.

So instead of thinking about objects which just happen to have some morphisms between them, we might take the opposite view and say that objects are only interesting as domains and codomains of morphisms.

This view is best expressed by category theory and specifically by the notion of universal properties (limits) - as we said in the previous chapter universal properties define an object *up to a unique isomorphism*. This means that if there are two or more objects that are isomorphic to one another and have exactly the same morphisms to all other objects in the category, then these objects are for all intends and purposes equivalent. 

Equivalent categories
---

In the beginning of the chapter, we were wondering what does it mean for two categories to be equal. And this question is even more interesting in the context of the category of categories. We said that categorical isomorphism is somewhat too rigid to accurately capture the concept. The paragraph above can serve as a good summary as to why this is the case: in isomorphic categories, isomorphic *objects* aren't considered equal (in the way that they are considered equal in universal properties.) for example the following two categories are not isomorphic. 

![Simple non-isomorphic categories](simple_non_isomorphic_categories.svg)

Being isomorphic means that two structures are completely the same. A map is isomorphic to an area only it represents the area completely, like if there is a arrow for each route and a point for each intersection.

![Isomorphic categories](isomorphic_categories.svg)

Suppose, though that there are two intersections that are positioned in such a way that for every road that goes to and from one of them, there is an identical road to the other one (maybe the one of these intercection was meant to replace the other one but it wasn't closed.) Then suppose that you have a map which displays these two intercections as one and the same intercection. 

![Non-isomorphic categories](non_isomorphic_categories.svg)

Would say that the map is complete? The answer comes down to what would you want to use the map for: if you want the map to accurately represents all the places that exist in the area, then it is not accurate. But if you want the map for practical purposes, if you only need it to make a route, then there is no reason to show two roads that are the same.

Two categories are isomorphic if there exist an *invertable* functor between them. But they are equivalent if they are connected by two functors that are isomorphic.

Everything is clear except the definition of functor isomorphism which we will look at in the next chapter.
