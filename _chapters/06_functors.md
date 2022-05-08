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

We began by reviewing the mother of all categories - *the category of sets* which is not only the archetype of a category, but it contains within itself many other categories, such as the category of types in a programming languages.

![The category of sets](category_sets.svg)

Special types of categories 
---

We also learned about some special types of categories that have some special properties like categories that have just one *object* (monoids, groups) and categories that have only one *morphism* between any two objects (preorders, partial orders.)

![Types of categories](category_types.svg)

Other categories
---

We also defined a lot of *categories based on different things*, like the ones based on logics/programming languages, but also less "serious ones", as for example the color-mixing one.

![Category of colors](category_color_mixing.svg)

Finite categories
---

And most importantly, we saw some categories that are *completely made up and have no value whatsoever*, such as my made-up soccer hierarchy. We call those *finite categories*. Although they are not useful by themselves, the idea of finite categories is important - we can draw any combination of points and arrows and call it a category, in the same way that we can construct a set out of every combination of objects.

![Finite categories](finite_categories.svg)

For future reference, let's see some examples of finite categories. The simplest category is $0$ (enjoy the minimalism of this diagram.)

![The finite category 0](finite_zero.svg)

The next simplest category is $1$ - it is comprised of one object no morphism besides its identity morphism (as usual, we don't draw or in general take note of the identity morphisms unless they are rellevant.)

![the finite category 1](finite_one.svg)

If we increment the number of objects to two, we see a couple of more interesting categories, like for example the category $2$ containing two objects and one morphism.

![the finite category 2](finite_two.svg)

**Task:** There are just two more categories that have 2 objects and at most one morphism between two objects, draw them.

And finally the category $3$ has 3 objects and also 3 morphisms (one of which is the composition of the other two.)

![the finite category 3](finite_three.svg)

Isomorphisms
===

Many of the categories we saw have similarities between one another, as for example both the color-mixing order and categories that represent logic have greatest and least objects. To pinpoint such similarities and understand what they mean, we specify formal ways to connect categories with one another. 

In chapter 1 we talked about set isomorphisms, which establish an equivalence between sets, if you remember, a set isomorphism is a *two-way function* between two sets, which can alternatively be viewed as two "twin" functions each of which equals identity when composed with the other. 

![Set isomorphism](set_isomorphism.svg)

Then, in chapter 4, we mentioned order isomorphisms and saw that they are the same thing as set isomorphisms, but with one extra condition - aside from being there, the functions that define the isomorphism have to preserve the order of the elements i.e. all elements have to have the same arrows pointing to and from them. Or more formally put, for any $a$ and $b$ if we have $a ≤ b$ we should also have $F(a) ≤ F(b)$ (and vise versa.)

![Order isomorphism](order_isomorphism.svg)

We can extend this definition to work for categories that have more than one morphism between two objects. The definition is a little more complex, but not a lot. It is the following: given two categories, an isomorphism between them is an invertible function between the underlying sets of objects, *and* an invertible function between the morphisms that connect them, which maps each morphism to a morphism with the same signature (or the same source and target) 

![Category isomorphism](category_isomorphism.svg)

If we examine it closely we will see that, although a little bit more complex, this definition is equivalent to the one we have for orders - it is just that when we can have more than one morphism between two given objects we need to explicitly specify which morphism corresponds to which in the other category.

![Category isomorphism](category_order_isomorphism.svg)

And when the categories that we connect with one another can potentially have just one morphism, we only need to connect the objects and to verify that the corresponding morphism actually exist in the other category (this is guaranteed by the *order-preserving* condition.) 


![Order isomorphism](category_order_isomorphism_2.svg)

As you see, categorical isomorphisms are not hard to define, however they are very *hard to find* in practice - the only one that comes to mind to me is the Curry-Howard-Lambek isomorphism from the last chapter. And the reason they are so rare is simple - if two categories are isomorphic, they basically contain the same data and it would be more accurate to refer to them as different *representations* of the same category than as separate categories.

<!--
comics:
OK, I think I got it - isomorphisms are when you have two similar pictures and you connect the dots.

Pretty much.
-->

What are functors
===

Much more abundant than isomorphisms, which are two-way connections between categories, are the one-way connections, which we will examine next. As you can guess, those are called *functors*. They are much like normal functions e.g. just like every set isomorphism is also a function, every categorical isomorphism is also a functor (but not the other way around). So it's quite appropriata to think of functors as *functions between categories.*

![Functor](functor.svg)

And now for the full definition: a functor between two categories (let's call them $A$ and $B$) consists of a pair of mappings - a mapping that maps each *object* in $A$ to an object in $B$ and a mapping that maps each *morphism* between any objects in $A$ to a morphism between objects in $B$ in a way that preserves the structure of the category. 

Object mapping
---

Let's go through each component of this definition. Firstly, we have a mappings between the categories' objects. These are just regular old functions, so the definition from chapter 1 applies.

> A function is a relationship between two sets that matches each element of one set, called the *source* of the function, with exactly one element from another set, called the converse domain, or the *target* of the function.

![Functor for objects](functor_objects.svg)

Formally, we can define the object mapping of of the functor as a function between the categories' *underlying sets*. 

Morphism mapping
---

The other mapping that forms the functor is a mapping between the categories' morphisms. This mapping resembles a function as well, but with the added requirement that each morphism with a given source and target must be mapped to a morphism with a corresponding source and target, as per the object mapping.

![Functor for morphisms](functor_morphisms.svg)

A more rigorous definition of a morphism function involves the concept of the *homomorphism set* - this is a set that contains all morphisms that go between given two objects in a given category as its elements. Utilizing this concept, we can say that a function between the morphisms of the two categories is actually a collection of the functions between their respective homomorphism sets.

![Functor for morphisms](functor_morphisms_formal.svg)

Note how the concepts of "homomorphism set" and of "underlying set" allowed us to "escape" to set theory when defining categorical concepts. We will talk more about this later.

Functor laws
---

So these are the two mappings (functions) that form a functor. But not every such pair of mappings is a functor. As we said, in addition to existing, the mappings should *preserve the structure* of the source category into the target category. 

What is the structure of a category? Let's revisit the definition from chapter 2:

> A category is a collection of *objects* (we can think of them as points) and *morphisms* (arrows) that go from one object to another, where:
> 1. Each object has to have the identity morphism.
> 2. There should be a way to compose two morphisms with an appropriate type signature into a third one in a way that is associative.

So this requirement translates to the following two laws, which are called the *functor laws*

1. Functions between morphisms should *preserve identities* i.e. all identity morphisms should be mapped to other identity morphisms.
 ![Functor](functor_laws_identity.svg)

2. Functors should also *preserve composition* i.e. for any two morphisms $f$ and $g$, the morphism that corresponds to their composition $F(g•f)$ in the source category should be the same as the morphism that corresponds to the composition of their counterparts in the target directory, so $F(g•f) = F(g)•F(f)$.
 ![Functor](functor_laws_composition.svg)

And this is all there is to it about functors - a simple but, as we will see shortly, very powerful idea.

Diagrams
===

Let's start with one that is very meta. Consider a diagram, any diagram from this book. By definition diagrams are, or aim to be, some kind of description of reality, so in order to understand them we have to relate them to some structure, be it a real-world or mathematical. For this, we have to associate each object from the diagram with an object from the external world, and also each morphism from the diagram with some kind of relationship between the corresponding real-world objects. 

So diagrams can be seen as a finite categories. But that is only a part of the story. They are finite categories plus ways of interpreting those categories in the context of other categories i.e. functors - when we are perceiving a diagram, we are actually creating a functor in our heads from the category that we see, to some other category. We might even argue (as I did in my blog post about using logic to model real-life thinking) that perception itself is functorial. 

For example, if we consider the preorder representing different cities and the roads in a given region, then a diagram that represents that order is actually just a map of the region where the cities are located, together with it's connection to the region it represents 

![A map and a preorder of city pathways](preorder_map_functor.svg)

Formally a *diagram* is a finite category (called the *index category* or *schema category*), together with a functor from that category to any other category that provides the interpretation of the category.

Object mapping
---

We already have a pretty good intuition of how diagrams work, but let's try to describe it in detail. The first component of any functor in a diagram is the mapping from the objects in the diagram to real-world objects. 

In the case of maps, this is done once by the people who create the map, but also by the user who, when seeing a given place in the map and the corresponding place in real-life, makes a mental connection between the two, based on the map labels.

Morphism mapping
---

The real value of most diagrams lies in the morphisms, and the fact that they correspond to morphisms between the objects they represent. Notice that in order to be a functor, the map does not have to represent *all* relations that these objects have, as for example a map does not have to list all roads that exist in real life, the only requirement is that *the roads that it lists should be actual* - this is a characteristic shared by all many-to-one relationships (functions.)

Functor laws
---

In diagrams, morphisms that are a result of composition are often not displayed, but we use them all the time 

For maps, for example, they are called *routes*.

![A map and a preorder of city pathways](preorder_map_functor_route.svg)

The law of preserving composition tells us that the route we create on a map corresponds to a real-world route. 

Constant functor
---
When we think about diagram functors (and even functors in general), our intuition is to think of every object in the souce category being mapped to a *different* object in the target. But that is not always the case. An interesting functor that doesn't follow that rule is the *constant functor* - one that maps *all* objects of the source category to a single object in the target (and all morphisms go to the identity morphism.

![Constant functor](constant_functor.svg)

This one that plays a part in some definitions that we will see later.

Functors in programming
===

Before we think about what functors are in programming languages, let's try to answer the million-dollar question: "How are functors *useful*?" (sometimes formulated also as "Why are you wasting my/your time with this?") We just saw that *maps are functors* and we know that *maps are useful*, so let's start from there. 

So why is a map (or any other kind of diagram) useful? Well, it obviously has to do with the fact that the points and arrows of the map corresponds to the cities and the roads in the place you are visiting in i.e. because of the very fact that it is a functor, but there is a second aspect as well: *maps are simpler to work with than actual thing they are representing i.e.* it is much easier to go through all routes between two given places by following a map than to actually drive through all these routes in real life. 

It the same point is valid also for programming: a functor from the realm of simple (primitive) types to the realm of more complex types allows you to work from the context of the simpler type while actually performing operations on the more complex one 

If we think about the category of simple types (like `string`, `number`, `boolean` etc) there are numerous functions between those types, like, as we said before, there are a myriad functions that convert a number to boolean.

![Functions from array to boolean](set_arrows.svg)

For complex types, like `List`, there aren't that many functions. But there also doesn't need to be that many of them, as with `map` we can use every function that convert strings to numbers to convert string arrays to number arrays.

![A functor in programming](functor_programming.svg)

Because they are simpler, maps don't include *all* roads and *all* traveling options. And the same is true for functors in programming - having a functor doesn't allow you to do define *all* operations using only the simple type, only some of them (some are better than nothing, right?) 

This would give you some notion for understanding what functors are in abstract terms, to formalize it, let's revisit the general functor definition in the context of programming, by just changing the terms we used, according to the table in chapter 2 and also (last but not least) change the font we use in our formulas from modern to monospaced.

> A functor between two categories (let's call them `A` and `B`) consists of a mapping that maps each *type* in `A` to a type in `B` and a mapping that maps each *function* between types in `A` to a function between types in `B` in a way that preserves the structure of the category.

(Mathematicians and programmmers are two communities, divided by their common appreciation of peculiar typefaces.)

Type mapping
---

The first component of a functor is a mapping that converts one type (let's call it `A`) to another type (`B`). So it is *like a function, but between types*. Such constructions are supported by almost all programming languages that have static type checking in the first place - they go by the name of *generic types*. 

A generic type is nothing but a function (sometimes called a *type-level function*) that maps one concrete type to another concrete type. For example, the type `Array<A>` maps the type `String` to `Array<String>`, `Number` to `Array<Number>` etc. 

![A functor in programming - type mapping](functor_programming_objects.svg)

Here is the time to make the important note that the existence of type-level function does not require that you also define a normal, value-level function, of type `A => Array<A>`. Functors in which such functions exist (which are most of them) are called *pointed functors*.

Function mapping
---

So the type mapping of a functor is simply a generic type in a programming language (we can also have functors between two generic types, but we will review those later.) However the nontrivial part of the functor is the *function mapping* - that is a mapping that convert any function operating on simple types, like `String ➞ Number` to a function between their more complex counterparts e.g. `Array<String> ➞ Array<Number>`. 

![A functor in programming - function mapping](functor_programming_morphisms.svg)

In programming languages, this mapping is represented by a higher-order function called `map` with a signature (using Haskell notation), `(a ➞ b) ➞ (Fa ➞ Fb)`, where `F` represents the composite type. 

Any function with that type signature gives rise to a functor, but not all such functors are useful. In practice, usually, there is only one of them that makes sense for a given generic type. For example, in the case of arrays and similar structures, `map` is a function that applies the original function (the one that converts simple types) to all elements of the structure. 

Because only one `map` function per generic type works (and also for simple convenience) you might sometimes see `map` defined directly in the datatype as a method. Here is how it might look in TypeScript, where it is implemented in the way that I described above:

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

Functor laws
---

Aside from facilitating code reuse by bringing in all standard functions of simple types in a more complex context, `map` allows us to work in a way that is predictable, courtesy of the functor laws, which in programming context look like this.

```
a.map(a => a) == a

const compose = (f, g) => f(g)
a.map(f).map(g) == a.map(compose(g, f))
```

**Task:** Use examples to verify that the laws are followed.

Endofunctors
===

Up until now we acted like different type families belong to different categories. However, that is not the case - they are actually one category. So all functors used in programming are *endofunctors* (ones in which the source and target category is one and the same). This doesn't make any difference when it comes to the above definitions (you can also think of the different type families as belonging to different categories if that's easier for you), but it does make a difference in other situations, for example, you can apply an endofunctor $F$ to a given value $a$ infinitely many times, adding more and more levels of nesting.

![A functor in programming as endofunctor](endofunctor_programming.svg)

This might look weird, but it does not lead to any type of paradox - there is nothing wrong about a list that contains other lists, and (though rarely useful in practice) you can have a list of lists of lists, or a list of lists of lists of lists etc (and the functor laws would still hold, provided that you called `map` the right number of times.)

Identity functor
---

There is one particular endofuctor that will probably look familiar to you - it is the *identity funcor*, the one that maps each object and morphism to itself.

![Identity  functor](identity_functor.svg)

The reason this functor is defined is the same reason as the identity morphisms are defined - they allow us to talk about value-related stuff without actually involving values. 

Homomorphism functors
===

Given any category, we can generate the set of the sets of all morphisms that have a specific type signature with respect to a given object from that category. This is called the *Homomorphism set*, denoted $Hom(B,_)$, $B$ being the object that you picked (for example, let's take the brown ball.)

![Homomorphism set](hom_set.svg)

This set forms a category where the morphism-sets are the objects (again *morphism-sets are objects*.) and the morphisms are the same as in the original category. And between those two categories (the original and the weird morphism-based one) there is a functor, called the homomorphism functor.

![Homomorphism set](hom_functor.svg)

**Question:** Which object should we pick so that the original and the homomorphism categories are isomorphic? 

With the homomorphism functors, we can *represent* any category in the category of sets. This is why homomorphism functors and all functors that are isomorphic to them are called *representable* functors.

Functors in monoids
===

In group theory, there is this cool thing called *group homomorphism* (or *monoid homomorphism* when we are talking about monoids) - it is a function between the groupss' underlying sets which preserves the group operation.

If the time of the day right now is $00:00$ then what would the time be after $n$ hours? The answer to this question can be expressed as a function from and to the set of integers.

![Group homomorphism as a function](group_homomorphism_function.svg)

This function is interesting - it preserves the operation of (modular) addition. That is, 13 hours from now the time will be 1 o'clock and if 14 hours from now it will be 2 o'clock, then the time after (13 + 14) hours will be (1 + 2) o'clock. 

Or to put it formally, if we call it (the function) $F$, then we have the following equation - $F(a + b) = F(a) m+ F(b)$ (where $m+$ means modular addition) Because this equation works, the $F$ function is a *group homomorphism* between the group of integers under addition and the group of modulo arithmetic with base 11 under modular addition. 


![Group homomorphism](group_homomorphism.svg)


The groups don't have to be so similar for there to be a homomorphism between them. Take, for example, the function that maps any number $n$ to 2 (or any other number) to the *power of $n$,* so  $n ➞ 2ⁿ$. This function gives a rise to a group homomorphism between the group of integets under addition and the integers under multiplication, or $F(a + b) = F(a) * F(b)$


![Group homomorphism between different groups](group_homomorphism_addition_multiplication.svg)

Wait, what were we talking about again? Oh yeah - group homomorphisms are functors. To see why, we switch to the category-theoretic representation of groups. Let's revisit our first example and, to make the diagram simpler, use mod 2 instead of mod 11.

![Group homomorphism as a functor](group_homomorphism_functor.svg)

Object mapping
---

Groups/monoids have just one object when viewed as categories, so there is also only one possible object mapping between any couple of groups/monoids - one that maps the (one and only) object of the source group to the object of the target group (not depicted in the diagram).

Morphism mapping
---

Because of the above, the morphism mapping is the only rellevant component of the group homomorphism. In the category-theoretic perspective group objects are morphisms and so the morphism mapping is just mapping between the group's objects, as we can see in the diagram.

Functor laws
---

The first functor law trivial, it just says that the one and only identity object of the source group (which corresponds to the identity morphism of its one and only object) should be mapped to the one and only identity object of the target group. And we can see that this is the case - in our first example, $0$, the identity of the addition operation, is mapped to $0$. And in the second one $0$ is mapped to $1$ - the identity object of the multiplication operation.

As we said, in order for a function to be a group homomorphism, it must satisfy the equation 
$F(a + b) = F(a) * F(b)$. And if you remember that, when interpreted categorically, group objects (like $1$ and $2$ $3$ etc.) correspond to morphisms (like $+1$, $+2$ $+3$ etc.) and the monoid operation of combining two objects corresponds to *functional composition*, you would see that this equation is actually a just a formulation of the second functor law $F(g•f) = F(g)•F(f)$.

$Task:$ Figure out how the functor law looks for the other group homorphism that we reviewed.

<!--
$gᵃ gᵇ= gᵃ⁺ᵇ$
-->

$Task:$ Although it's trivial, we didn't prove that the first functor law (the one about the preservation of identities always holds. Interestingly enough, for groups/monoids it actually follows from the second law. Try to prove that. Start with the definition of the identity function.


<!-- TODO show isomorphism theorems --> 

Functors in orders
===

And now let's talk about one concept that is completely unrelated to functors, nudge-nudge (I know you are probably tired of this but hey, bad jokes are better than no jokes at all.) In the theory of orders, we have functions between orders (which is unsurprising, as orders, like monoids/groups, are based on sets.) And one very interesting type of such function, which has applications in calculus and analysis, is a *monotonic function* (also called *monotone map*). This is a function between two orders that *preserves the order* of the elements. So a function $F$ is monotonic  when for every $a$ and $b$ in the source order, if $a ≤ b$ then $F(a) ≤ F(b)$.

For example, the function that maps the current time to the distance travelled by some object is monotonoc because the distance travelled increases (or stays the same) as time increases.

![A monotonic function](monotone_map.svg)

If we plot this or any other monotonic function on a line graph, we see that it goes just one direction.

![A monotonic function, represented as a line-graph](monotone_map_plot.svg)

Now we are about to prove that monotonic functions are functors too, ready?

Object mapping
---

The object mapping component of functors between monoids is trivial. Here it is the reverse - the object mapping is the central component of the functor.

Morphism mapping
---

In orders, there can be just one morphism between given two objects, and so morphism-mapping component of functors between them is trivial. Given two objects from the source order, if there is a morphism between them we map that morphism to the morphism between their corresponding objects in the target order. The fact that the monotonic function respects the order of the elements, ensures that the latter morphism exists.

Functor laws
---

It is not hard to see that monotone maps obey the first functor law - identities are the only morphisms that go between a given object and itself. 

And the second law also follows from the fact that there is only one morphism with a given signature. Suppose we have a monotone map. Suppose that in the source order we have two morphisms $f :: a ➞ b$ and $g :: b ➞ c$. Then, in the target order would contain morphisms that correspond to those two: $F(f): F(a) ➞ F(b)$ $F(g): F(b) ➞ F(c)$ 

If we compose the two morphisms in the target order, we get a morphism $F(g)•F(f) :: F(a) ➞ F(c)$. 

If we compose the two morphisms in the source order, we get a morphism $g•f :: a ➞ c$. And from it, we can get the corresponding morphism in the target category - $F(g•f) :: F(a) ➞ F(c)$.

But both morphisms $F(g•f)$ and $F(g)•F(f)$ have the signature $F(a) ➞ F(c)$ and so they must be equal to one another.

The category of small categories
===

Ha, I got you this time (or at least I hope I did) - you probably thought that I won't introduce another category in this chapter, but this is exactly what I am going to do. And another surprise is that the new category won't be the category of functors (don't worry, we will introduce that in the next chapter.) Instead, we will examine the category of (small) categories, that has all the categories that we saw so far as objects and functors as its morphisms, like $Set$ - the category of sets, $Mon,$ the category of monoids, $Ord,$ the category of orders etc.

![The category of categories](category_of_categories.svg)

**Task:** Go through the functor definition and see how you can make functors compose. 

**Question:** What are the initial and terminal object of the category of small categories.

Categories all the way down
---

The recursive nature of category theory might leave some of you confused: we started by saying that categories are *composed of objects and morphisms*, but now we are saying that there are morphisms between categories (functors) and a category where *the objects are categories themselves*. Does that mean that categories are an example of... categories? Yes. Sounds a bit weird on intuitive level (as for example biscuits don't contain other biscuits and houses don't use houses as building material) but it is perfectly legitimate.

Category theory does *categorize* (see what I did there) everything, so from a category-theoretic standpoint all of maths is categories all the way down and whether you would threat a given category as a universe, or as a point depends solemly on your viewpoint.

Like for example, every monoid is a category with one just object. But at the same time, monoids can be seen as belonging to one category - the category of monoids - with monoid homomorphisms acting as objects.

At the same time we have the category of groups, for example, which contains the category of monoids as a subcategory, as all monoids are groups.

There may be many more levels of categories from categories. However that does not mean that we have to cover all of them and think about them at all. It is like the concept of a derivative in calculus - the first derivative of a position of the object gives its *speed*, which is useful, the derivative of speed is also useful - it is *velocity*, but the derivative of velocity and those after it leave us indifferent. 

We can use the same tactict with our little journey in category theory - stick on the level that make sense for us and not be obsessed with forming picture of the whole thing Because there is no *whole thing* - category theory is an *abstract* theory. That is, it does not seek to represent an actual state of affairs, but to provide a language that you can use to express many different ideas, actual or purely imaginary. So view the category of categories not as a structure, but as a space, where all these concepts live.

{% if site.distribution == 'print' %}

Free and forgetful functors
===

A lot of categories that are in $Cat$ are based on each other i.e. ones where one category is the same as the other plus some additional law - groups are monoids with added inversion, partial orders are antisymmetric preorders. And virtually all categories can be viewed as are sets with added morphisms. Between any two such categories there are two functors called the *forgetful* functor that goes from the richer category to the more plain one and the *free* functor, which goes the other way around.

![Free and forgetful functors](free_forgetful_functors.svg)


Forgetful functors
===

Forgetful functors map the objects from the more richer and featureful category to their corresponding objects in the simpler and more unstructured one. 

![Forgetful functors](forgetful_functors.svg)

They strip (forget) all the structure of the more complex category which is not present in the simpler one. i.e. 

Object mapping
---

The object mapping of the forgetful functor consists of picking the object in the simpler category that corresponds to the one from the richer one. It works by just removing the extra structure or properties of each object in the richer category which is not present in the simpler one.

Let's take the forgetful functor between the category of sets $Set$ and the category of monoids ($Mon$) as an example. A monoid is a set, combined with *a monoid operation*. The monoid operation is the extra structure. And if you do away with it, what is left from a monoid is its underlying set. This observation defines the object mapping of a forgetful functor that goes from the category of monoids to the category of sets - each monoid is mapped to it's underlying set.

![Forgetful functor - object mapping](forgetful_functor_objects.svg)

This same type of functor exists for any two categories that are based on each other. Or equally correct two categories are based on each other only if such a functor exist.

Morphism mapping
---

In order for the forgetful functor to really be a functor it also must map morphisms between the two categories i.e. to map every *monoid homomorphism* between two monoids to a function between their underlying sets. 

This is not hard - we said that monoid homomorphisms are function between the monoids' underlying sets which preserves the group operation. Which means that they are functions already functions between the monoids' underlying sets. So all we need to do is to forget about the extra conditions.

Functor laws
---

In this case the functor laws are obviously followed - we basically copied the structure of one category into the other one.

Free functors
===

Now let's review the functor that has certain relation to the forgetful functor, but goes the other way around - from richer to simpler categories.

![Free functors](free_functors.svg)

Saying "going the other way around" is actually not entirely accurate, as we cannot literary reverse the mapping from the forgetful functor. This is so, simply due to the fact that given one simple structure (such as a set) there can be more than one richer structures that correspond to it (e.g. the set of natural numbers is the underlying set of both the monoid of natural numbers under addition and the monoid of natural numbers under mutliplication.)

But, although we cannot create a functor that is the reverse of the forgetful functor, there is one functor that still has some interesting connection to it - this functor is called the *free functor* for a given category. It works by connecting each object from the simpler category to the *free object* corresponding to it. In our case the case of monoids it is the free monoid generated by a given set.

Object mapping
---

The object mapping of the free functor is the procedure for generating free objects. For any given object $o$ from the simpler category the free object of $o$, $F(o)$ is an object of the more complex category that adds the minimum structure needed for the $o$ to become an object of the more complex category.

When we reviewed free monoids we said that the free monoid of a given set of is just the monoid that "does nothing" i.e. the one that has no laws. What does that mean?

As we said in chapter 3 each monoid can be represented by a set of basic elements, called generators, (such as the 60 degree rotation of a right triangle)

![Generator of the monoid of rotations](generator_rotations.svg)

And a bunch of rules or equations describing how sequences of these generators collapse to a single eleement (e.g. the fact that rotating the triangle three times gets you to its initial position.)

![Rule of the monoid of rotations](rule_rotations.svg)

Here the rules for a given set of generators can be arbitrary, so the free monoid is the monoid that has no such rules. As a result, the free monoid of a given set is the monoid of all possible (endless) sequences of elements of a that set (which is taken as the monoid's set of generators.

If you think about this definition we would realize that the free monoid is actually just the *list datatype* that we are familiar from programming. And the free functor converting sets to monoids is actually the list functor that we saw in one of the previous sections.

![Free functors](free_functor_objects.svg)

Formally the free monoid over a set $A$ is just the type $[A]$ and the free functor is the function $a \to [a]$ for all $a:A$.

Morphism mapping
---

Once we established that the free functor for set $A$ is just the list functor we already know how the the morphism mapping that converts function between sets to functions between lists of sets, and the way to construct this mapping is to apply the function to every element of that list.

Adjoint functors
===

If the concept of a free object and the corresponding free functor seemed somewhat arbitrary to you, don't worry, it will seem clearer once we pinpoint the relationship it has with the (arguably more straightforward) concept of forgetful functor. 

Given a free object *in the richer category* (i.e. free monoid) from a given set of generators, there exists a monoid homomorphism from it, to any other monoid with the same set of generators.

![Adjunction](adjunction_1.svg)

The homomorphism consists of just applying the monoid laws and by doing that collapsing the infinite lists of elements of the free monoid into (possibly finite) elements in the other one.

Then, given a set in the more basic category, there exist a morphism from it to the underlying set of any monoid that is generated by the elements of that set as generators.

![Adjunction](adjunction_2.svg)

Finally, any two such functions are actually the same function.

![Adjunction](adjunction_3.svg)

This relationship, called an *adjunction* defines what the free functor is in terms of the forgetful one.

Let's take another example. The free monoid with just one generator can be mapped to all cyclic monoids like $Z_{1}$, $Z_{2}$, $Z_{3}$ etc. as well as to the monoid of natural numbers under addition. And because of that in the category of sets, the singleton set can be mapped to the underlying sets of all these monoids.

![Adjunction](adjunction_numbers.svg)

There definitely is more to be said about free and forgetful functors, as well as for adjunctions (which are not only of free/forgetful type), but as always, I will leave things at the most interesting moment in order to revisit them from a different perspective later.

{%endif%}

