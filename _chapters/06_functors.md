---
layout: default
title: Functors
---

Functors 
===

From this chapter on, we will change the tactic a bit (as I am sure you are a bit tired of jumping through different subjects) and, we will dive at full throtle into the world of categories, using the structures that we examined so far as context. This will allow us to generalize some of the concepts that we saw in these structures so they are valid for all categories. 

Categories we saw so far
===

So far, we saw many different categories and category types. Let's review them before we dive in to functors.

The category of sets
---

We began (in chapters 1 and 2) by reviewing the mother of all categories - *the category of sets* which is not only the prototype of a category, but it contains many other categories, such as the category of types in a programming languages.

![The category of sets](category_sets.svg)

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

And most importantly, we saw some categories that are *completely made up and have no value whatsoever*, such as my made-up soccer hierarchy. We call those *finite categories*. Although few the finite categories are useful by themselves, the idea of finite categories is important - we can draw any combination of points and arrows and call it a category, in the same way that we can construct a set out of every combination of objects.

![Finite categories](finite_categories.svg)

For future reference, let's see some basic finite categories. The simplest category is **0** (enjoy the minimalism of this diagram.)

![The finite category 0](finite_zero.svg)

The next simplest category is **1** - it is comprised of one object no morphism besides its identity morphism (as usual, we don't take note of the identity morphisms unless they are rellevant.)

![the finite category 1](finite_one.svg)

If we increment the number of objects to two, we see a couple of more interesting categories, like for example the category **2** containing two objects and one morphism.

![the finite category 2](finite_two.svg)

**Task:** There are just two more categories that have 2 objects and at most one morphism between two objects, draw them.

And finally the category **3** has 3 objects and also 3 morphisms (one of which is the composition of the other two.)

![the finite category 3](finite_three.svg)

Categorical Isomorphisms
===

Many of the categories we saw have similarities between one another, as for example both the color-mixing order and categories that represent logic have greatest and least objects. To pinpoint such similarities and understand what they mean, we specify formal ways to connect categories to one another. In chapter 1 we talked about set isomorphisms, which establish an equivalence between sets. If you remember, a set isomorphism is a *two-way function* between two sets or, alternatively it can be seen as two "twin" functions each of which equals identity when composed with the other. 

![Set isomorphism](set_isomorphism.svg)

Then, in chapter 4, we mentioned order isomorphisms and saw that they are the same thing as set isomorphisms, but with one extra condition - aside from being there, the functions that define the isomorphism have to preserve the order of the elements i.e. all elements have to have the same arrows pointing to and from them. Or more formally put: **a** and **b**, **a ≤ b** iff **F(a) ≤ F(b)**. 

![Order isomorphism](order_isomorphism.svg)

We can extend this definition to work for categories as well. However, unlike orders, categories can have more than one morphism between two objects, so the definition is a little more complex.

It is the following: given two categories, an isomorphism between them is an invertible function between the underlying sets of objects, *and* an invertible function between the morphisms that connect them, which maps each morphism to a morphism with the same signature (the "signature" of a function is just its input and output, so two functions have the same signature if they have the same input and output sets).

![Category isomorphism](category_isomorphism.svg)

Although a little more complex, this definition is the same as the one we have for orders - it is just that when dealing with categories, we have to account for the fact that we can have more than one morphism between two objects and so we need to explicitly specify which one corresponds to which, while in order theory we only need to verify that the corresponding morphism actually exist (for orders is done by the *order-preserving* condition.) So those are categorical isomorphisms. 

However, categorical isomorphisms are actually pretty rare - the only one that comes to mind is the Curry-Howard-Lambek isomorphism from the last chapter. If two categories are isomorphic, they basically contain the same data and it would be more accurate to refer to them as different *representations* of the same category than as separate categories.

<!--
comics:
OK, I think I got it - isomorphisms are when you have two similar pictures and you connect the dots.

Pretty much.
-->

What are functors
===

Much more abundant than isomorphisms, which are two-way connections between categories, are one-way connections between categories, which we will examine next. As you might have guessed, those are called functors (and also maps).

Functors are much more abundant than isomorphisms because each isomorphism is also a functor (actually two functors), but not the other way around.

A functor between two categories (let's call them **A** and **B**) consists of a mapping that maps each *object* in **A** to an object in **B** and a mapping that maps each *morphism* between objects in **A** to a morphism in **B** in a way that preserves the structure of the category.

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

So these are the two components that form a functor. But aside from defining them we should verify that they preserve the structure of the input category into the output. What is the structure of a category? As stated in the category definition in chapter 2:

> A category is a collection of **objects** (we can think of them as points) and **morphisms** (arrows) that go from one object to another, where:
> 1. Each object has to have the identity morphism.
> 2. There should be a way to compose two morphisms with an appropriate type signature into a third one in a way that is associative.

So this requirement translates to the following two laws, which are called the *functor laws*

1 Functions between morphisms should *preserve identities* i.e. all identity morphisms should be mapped to other identity morphisms.

![Functor](functor_laws_identity.svg)

2 They should also *preserve composition* i.e. for any two morphisms **f** and **g**, the morphism that corresponds to their composition **F(g f)** in the input category should be the same as the morphism that corresponds to the composition of their counterparts in the target directory, so **F(g f) = F(g) F(f)**.

![Functor](functor_laws_composition.svg)

And this is all there is to it about functors - a simple but, as we will see shortly, very powerful idea.

Diagrams as functors
===

Let's start with one that is very meta. Consider a diagram, any diagram from this book. By definition diagrams are, or aim to be, some kind of description of reality, so in order to understand them we have to relate them to some structure, be it a real-world or mathematical. For this, we have to associate each object from the diagram with an object from the external world, and also each morphism from the diagram with some kind of relationship between the corresponding real-world objects. But diagrams are just finite categories. So when we are perceiving a diagram, we are actually creating a functor in our heads. We might even say that the functor is perception itself.

For example, if we consider the preorder representing different cities and the roads in a given region, then a diagram that represents that order is actually just a map of the region where the cities are located.

![A map and a preorder of city pathways](preorder_map_functor.svg)

Knowing that the lines on the map represent the roads that connect different points in the city allows you to find your way around, even if there are no labels.

Object mapping
---

We already have a pretty good intuition for the functor between a diagram and a set of real-world object, but let's try to describe it in detail. The first component of this functor is the mapping from the objects in the diagram to real-world objects. In the case of maps, this is done once by the people who create the map, but also by the person who uses it, who, when seeing a given place in the map and the corresponding place in real-life, makes a mental connection between the two, based on the map labels.

Morphism mapping
---

The real value of most diagrams lies in the morphisms, so all their morphisms have to correspond to morphisms between the objects they represent. Notice that in order to be a functor, the map does not have to represent *all* relations that these objects have, as for example a map does not have to list all roads that exist in real life, the only requirement is that *the roads that it lists should be actual*. This is a characteristic shared by all many-to-one relationships (functions.)

Functor laws
---

Morphisms that are a result of composition are not displayed, but we use them all the time they are called routes.

![A map and a preorder of city pathways](preorder_map_route.svg)

The law of preserving composition tells us that the route we create on a map corresponds to a real-world route. 

In diagrams, identities are not displayed.

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

So the type mapping of a functor can correspond to a generic type in a programming language (we can also have functors between two generic types, but we will review those later.) However the nontrivial part of the functor is the *function mapping* - that is a mapping that convert any function of simple types, like `String ➞ Number` to a function between their more complex counterparts e.g. `Array<String>  ➞ Array<Number>`. 

In programming languages, this mapping is represented by a higher-order function called `map` with a signature `(a ➞ b) ➞ (Fa ➞ Fb)` (where `F` represents the composite type.)

Any function with that type signature gives rise to a functor, but not all such functors are useful. In practice, usually, there is only one of them that makes sense for a given generic type. For example, in the case of arrays and similar structures, `map` is a function that applies the original function (the one that converts simple types) to all elements of the structure. 

Because only one `map` function per generic type works (and for simple convenience) you might sometimes see `map` defined directly in the datatype as a method. Here is how it might look in TypeScript, where it is implemented in the way that I described above:

```
class Array<A> {
  map (f: A ➞ B): Array<B> {
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
a.map((a => a) == a)

const compose = (f, g) => f(g)
a.map(f).map(g) == a.map(compose(g, f))
```

**Task:** Use examples to verify that the laws are followed.

Functors in monoids
===

In group theory, there is this cool thing called *group homomorphism* (or *monoid homomorphism* when we are talking about monoids) - it is a function between the groups's underlying sets which preserves the group operation.

Like, imagine if we have the function which shows you what would be the time after n hours

![Group homomorphism as a function](group_homomorphism_function.svg)

Perhaps somewhat surprisingly, this function preserves the operation of addition. That is, if the time after 13 hours it will be 1 o'clock and the time after 14 hours will be 2 o'clock, then the time after (13 + 14) hours will be (1 + 2) o'clock. Or to put it formally, if we call the function that computes the time after some hours **mod11**, then we have **mod11(a + b) = mod11(a) + mod11(b)**. And because of this equation, this function is a group homomorphism between the group of integers under addition and the group of modulo arithmetic with base 11, again under addition. 

![Group homomorphism](group_homomorphism.svg)

And the groups don't have to be the same composition operator. Take for example the function that maps any number n to 2 (or any other number) to the n-th **power** so  **n ➞ 2ⁿ**. This function gives a rise to a group homomorphism between the group of integets under addition and the integers under multiplication.

![Group homomorphism between different groups](group_homomorphism_addition_multiplication.svg)

Wait, what were we talking about? Oh yes - group homomorphisms are functors. To see why, we switch to the category-theoretic representation of groups (to make the diagram simpler I am using the group **mod3** as the output group instead of mod11**.)

![Group homomorphism as a functor](group_homomorphism_functor.svg)

Object mapping
---

By definition Groups/monoids are categories that have just one object, so there is only one possible object mapping between any couple of groups/monoids - one that maps the object of the input group to the object of the output group.

Morphism mapping
---

Because of the above, the morphism mapping is the only rellevant component of the group homomorphism. In the category-theoretic perspective group objects are morphisms and so the morphism mapping is just mapping between the group's objects, as we can see in the diagram.

Functor laws
---

Not every function between group objects is a homomorphism, but as we said the above example is one due to the equation **mod11(a + b) = mod11(a) + mod11(b)**. But wait, this looks very familiar - it is enough to change some letters and symbols and we will see that it is just a restatement of the functor law for preserving composition - **F(g•f) = F(g)•F(f)**.

**Task:** Figure out how the functor law looks for the other group homorphism that we reviewed.

<!--
**gᵃ gᵇ= gᵃ⁺ᵇ**
-->

The other functor law trivial, it just says that the one and only identity object of the input group (which corresponds to the identity morphism of its one and only object) should be mapped to the one and only identity object of the output group.

<!-- TODO show isomorphism theorems --> 

Functors in orders
===

And now let's talk about one concept that is completely unrelated to functors, nudge-nudge (I know you are tired of this, but hey, bad jokes are better than no jokes at all.) In the theory of orders we have functions between orders which is unsurprising, as orders, like monoids/groups, are based on sets. And one very interesting type of order function which has applications in calculus and analysis is a *monotonic function* (also called *monotone map*). This is a function between two orders that preserves the order of the elements. So a function **F** is monotonic  when for every **a** and **b** in the input order, if **a ≤ b** then **F(a) ≤ F(b)**.

For example, the function that maps the current time to the distance travelled by some object is monotonoc because the distance travelled increases (or stays the same) as time increases.

![A monotonic function](monotonic_function.svg)

If we plot this or any other monotonic function on a line graph, we see that it goes just one direction.

![A monotonic function, represented as a line-graph](monotonic_function_line_graph.svg)

Now we are about to prove that monotonic functions are functors too, ready?

Object mapping
---

The object mapping component of functors between monoids is trivial. Here it is the reverse - the object mapping is the central component of the functor.

Morphism mapping
---

In orders, there can be just one morphism between given two objects, and so morphism-mapping component of functors between them is trivial. Given two objects from the input order, if there is a morphism between them we map that morphism to the morphism between their corresponding objects in the output order. The fact that the monotonic function respects the order of the elements, ensures that the latter morphism exists.

Functor laws
---

It is not hard to prove that monotone maps obey the functor laws - monotone maps match all identity morphisms with one another because in orders identities are the only morphisms that go between a given object and itself. And they preserve composition for the same reason. 

Here is the full proof: One thing we know about monotonic maps is that they preserve the order of the elements, which means (in category-theoretic terms) that if a morphism with a signature **a ➞ b** in the input order exists, then the morphism **F(a) ➞ F(b)** in the output order would exist too. Let's denote these two morphisms **f** and **F(f)**.

Suppose that there exist another morphism **b ➞ c** in the input. Then by the same logic **F(b) ➞ F(c)** would exist as well. Let's denote these morphisms **g** and **F(g)**.

If we compose the two morphisms in the output order, we get a morphism **F(g)•F(f) :: F(a) ➞ F(c)**. 

And if we compose the two morphisms in the input order, we get a morphism **g•f :: a ➞ c**. And from it, we can get the corresponding morphism in the output category - **F(g•f) :: F(a) ➞ F(c)**.

But both morphisms **F(g•f)** and **F(g)•F(f)** have the same signature - **F(a) ➞ F(c)** and for orders we know that there can exist only one morphism with a given signature. So **F(g•f) = F(g)•F(f)**.

In this case the compositions 
But this means that the composition of these two pairs of morphisms should exist as well, so 


**F(g•f) = F(g)•F(f)**.

<!--
Functors in logic
===
-->

Free and Forgetful Functors
---

Some other functors
===

Before we continue, we will review the functor-related concepts that we saw so far, as well as some that we will see later on.



Diagram
---

As we saw, a diagram, can be represented as functor from a finite category, called an *index* category (or a *map* as we dubbed it earlier) to some other category.

Homomorphism functor
---

For any category, we can generate the set of all morphisms that have a specific type signature 

![Homomorphism set](homomorphism_set.svg)

Between those two categories, there is a functor, calle the homomorphism functor, between the objects and the morphism sets, where the the morphisms play the role of objects. Again, the morphisms are objects.

This category will have morphisms for object and morphism composition. For example, if we take the color-mixing category, the functor **Hom(B,_)** (the Black ball) would look like this.

![Homomorphism functor](homomorphism_functor.svg)

Endofunctor
---

When programming, we are working in just one category - the category of types in the language that we are working with, so all functors that 

Identity functor
---

There is one particular endofuctor that will probably look familiar to you - it is the identity functor - one which maps each object and morphism to itself.

The category of small categories
===

Ha, I got you this time (or at least I hope I did). You probably thought that I won't introduce another category in this chapter, but this is exactly what I am going to do. And another surprise is that the new category won't be the category of functors (don't worry, we will introduce that in the next chapter.) Instead, we will examine the category of (small) categories. 

This category has all the categories that we saw so far as objects and functors are its morphisms. 

**Task:** Go through the functor definition and see how you can make functors compose. 

**Question:** What are the initial and terminal object of the category of small categories.

There isn't much to say about this category, it is just a good exercise to try to visualize it.

[The category of categories](category_of_categories)

The ghost of Russell's paradox
---

We say *small* because otherwise the category will include itself and it's going to be Russell's paradox all over again.

Categories all the way down
---

The recursive nature of category theory might leave some of you confused: we started by saying that categories are composed of objects and morphisms, but now we are saying that there are morphisms between categories as well. Does that mean that categories are an example of categories? 

Yes. Sounds a bit weird on intuitive level (as for example biscuits don't contain other biscuits and houses don't use houses as building material) but it is perfectly legitimate.



category theory does *categorize* (see what I did there) everything as categories, so it is categories all the way down, like for example, every monoid is a category with one just object.

But at the same time, monoids can be seen as belonging to one category - the category of monoids - with monoid homomorphisms acting as objects.

At the same time we have the category of groups, for example, which contains the category of monoids as a subcategory, as all monoids are groups.

There may be many more levels of categories within categories. 

However that does not mean that we have to cover all of them and think about them at all. It is like the concept of a derivative in calculus - the first derivative of a position of the object gives its *speed*, which is useful, the derivative of speed is also useful - it is **velocity**, but the derivative of velocity and those after it leave us indifferent. We can use the same tactict with our little journey in category theory - stick on the level that make sense for us and not be obsessed with forming picture of the whole thing Because there is no *whole thing* - category theory is an *abstract* theory. That is, it does not seek to represent an actual state of affairs, but to provide a language that you can use to express many different ideas, actual or purely imaginary. So view the category of categories not as a structure, but as a space, where all these concepts live.
