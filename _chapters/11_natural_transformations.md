---
layout: default
title: Natural transformations
---

Natural transformations 
===

> I didn’t invent categories to study functors; I invented them to study natural transformations. --- Saunders Mac Lane

In this chapter, we will introduce the concept of a morphism between functors or *natural transformation*. Understanding natural transformations will enable us to define category equality and some other advanced concepts.

Natural transformations really are at the heart of category theory, however, their importance is not obvious at first. So, before introducing them, I like to talk, once more, about the body of knowledge that this heart maintains (I am good with metaphors... in principle).

Equivalent categories
===

Our first section aims to introduce natural transformation as a motivating example for creating a way to say that two categories are equal. But for that, we need to understand what equal categories are and should be.

So, are you ready to hear about equivalent categories and natural transformations? Actually it is my opinion that you are not (no offence, they are just very hard). So, we will take a longer route. I can put this next section anywhere in this book, and it would always be neither here nor there. But anyway, if you are studying math, you are probably interested in the *nature of the universe*. "What is the quintessential characteristic of all things in this world?" I hear you ask...

Objects are overrated AKA Heraclitus was right!
---

> The world is the collection of facts, not of things. --- Ludwig Wittgenstein

What is the quintessential characteristic of all things in this world? Some 2500 years ago, the philosopher Parmenides gave an answer to this question, postulating that the nature of universe is permanence, stasis. According to his view, what we perceive as processes/transformations/change are merely illusory appearances ("Whatever is is, and what is not cannot be"). He said that that things never really change, they only *appear* to change, or (another way to put it), only appearances change, but the *essence* does not (I think, this is pretty how the world "essence" came to exist).

Although far from obviously true, his view is easy for people to relate to --- objects are all around us, everything we "see", both literary (in real life), or metaphorically (in mathematics and other disciplines), can be viewed as *objects*, persisting through space and time. If we subscribe to this view, then we would think that the key to understanding the world is understanding *what objects those are*. In my opinion, this is what set theory does, to some extend, as well as classical logic (Plato was influenced by Parmenides when he created his theory of forms).

However, there is another way to approach the question about the nature of the universe, which is equally compelling. Because, what is an object, when viewed by itself? Can we study an object in isolation? And will there anything left to study about it, once it is detached from its environment? If a given object undergoes a process to get all of it's part replaced, is it still the same object?

Asking such questions might lead us to suspect that, although what we *see* when we look at the universe are the objects, it is the processes/relations/transitions or *morphisms* between the objects that are the real key to understanding it. For example, when we think hard about everyday objects we realize that each of them has a specific *functions* (note the term) without which, a thing would not be itself e.g. is a lamp that doesn't glow, still a lamp? Is there food that is non-edible (or an edible item that isn't food)? And this is even more valid for mathematical objects, which, without the functions that go between them, are not objects at all. So, instead of thinking about objects that just happen to have some morphisms between them, we might take the opposite view and say *that objects are only interesting as sources and targets of morphisms.* 

Although old, dating back to Parmenides' alleged rival Heraclitus, this view has been largely unexplored, until the 20th century, when a real mathematical revolution happened: Bertrand Russell created type theory, his student Ludwig Wittgenstein wrote a little book, from which the above quote comes from, and this book inspired a group of mathematicians and logicians, known as the "Vienna circle". Part of this group was Rudolph Carnap who coined the word "functor"...

Isomorphism invariance
---

An embodiment of Heraclitus' view in the realm of category theory is the concept of *isomorphism invariance* that we implicitly touched several times. 

All categorical constructions that we covered (products/coproducts, initial/terminal objects, functional objects in logic) are *isomorphism-invariant*. Or, equivalently, they define an objects *up to an isomorphism*. 

Or, if there are two or more objects that are isomorphic to one another, and one of them has a given property, then the rest of them would to also have this property as well. 

In short, in category theory **isomorphism = equality**.

The key to understanding category theory lies in understanding isomorphism invariance. And the key to understanding isomorphism invariance are natural transformations.

Categorical isomorphisms are *not* isomorphism-invariant
---

Let's ask ourselves the same question that we were pondering at the beginning of the previous chapter --- what does it mean for two categories to be equal. 

In the prev chapter, we talked a lot about how great isomorphisms are and how important they are for defining the concept of equality in category theory, but at the same time we said that *categorical isomorphisms* do not capture the concept of equality of categories.

![Isomorphic categories](../11_natural_transformations/isomorphic_categories.svg)

This is because (though it may seem contradictory at first) *categorical isomorphisms aren't isomorphism invariant*, i.e. categories that only differ by having some additional isomorphic objects aren't isomorphic themselves.

![Isomorphic categories](../11_natural_transformations/equal_categories.svg)

For this reason, we need a new concept of equality of categories. A concept that would elucidate the *differences* between categories with different structure, but also the *sameness* of categories who have the same categorical structures, disregarding the differences that are irrelevant for category-theoretic standpoint. That concept is *equivalence*.

<!--comic-->
**Parmenides:** This category surely cannot be equal to the other one --- it has a different amount of objects!

**Heraclitus:** Who cares bro, they are isomorphic.

Equivalences are isomorphism invariant
---

To understand equivalent categories better, let's go back to the functor between a given map and the area it represents (we will only consider the thin categories (AKA orders) for now). In order for this functor to be invertible (and the categories --- isomorphic) the map should represent the area completely i.e. there should be arrow for each road and a point for each little place.

![Isomorphic categories](../11_natural_transformations/isomorphic_map.svg)

Such a map is necessary if your goal is to know about all *places*, however, like we said, when working with category theory, we are not so interested in *places*, but in the *routes* that connect them i.e. we focus not on *objects* but on *morphisms*.

For example, if there are intersections that are positioned in such a way that there are routes from one and to the other and vice-versa a map may may collapse them into one intersection and still show all routes that exist. 

![Equivalent categories](../11_natural_transformations/equivalent_map.svg)

These two categories are *not isomorphic* --- going from one of them to the other and back again doesn't lead you to the same object. 

However, going from one of them to the other would lead you at least to an *isomorphic object*. 

![Equivalent categories](../11_natural_transformations/equivalent_map_equivalence.svg)

In this case we say that the orders are *equivalent*.

Defining equivalence in terms of objects
---

We know that two orders are isomorphic if there are two functors, such that going from one to the other and back again leads you to the same object.

And two orders are equivalent if going from one of them to the other and back again leads you to the same object, *or to an object that is isomorphic to the one you started with.* 

![Equivalent orders](../11_natural_transformations/equivalent_orders.svg)

But when does this happen? To understand this, we plot the orders as a Hasse diagram.

![Equivalent orders](../11_natural_transformations/equivalent_orders_hasse.svg)

You can see that, although not all objects are connected one-to-one, *all objects at a given level are connected to objects of the corresponding level*.

To formalize that notion, we remember the concept of *equivalence classes* that we covered in the chapter about orders. Let's visualize the relationship of the equivalence classes of the two orders that we saw above.

![Orders with isomorphic equivalence classes](equivalent_order_classes.svg)

You can see that they are isomorphic. And that is no coincidence: two orders are equivalent precisely when the orders made of their equivalence classes are isomorphic.

This is a definition for equivalence of orders, but unfortunately, it does not hold for all categories --- when we are working with orders, we can get away by just thinking about *objects*, but categories demands that we think about morphisms i.e. to prove two categories are equivalent, we should establish an isomorphism between their *morphisms*. 

For example, the following two categories are *not* equivalent, although their equivalence classes are isomorphic --- the category on the left has just one morphism, but the category on the right has two.

![Non-equivalent categories](../11_natural_transformations/unequal_categories.svg)

One way of defining equivalence of categories is by generalizing the notion of equivalence classes of orders to what we call *skeletons* of categories, a skeleton of a category being a subcategory in which all objects that are isomorphic to one another are "merged" into one object (isomorphic objects are necessarily identical).

However, we will leave this (pardon my French) as an *exercise for the reader*. Why? We already did this when we generalized the notion of normal set-theoretic functions to *functors*, and so it makes more sense to build up on that notion. Also, we need a motivating example for introducing natural transformations, remember?

Defining equivalence in terms of morphisms
---

In the chapter about orders, we presented a definition of order *isomorphisms*, that is based on *objects*:

> An order isomorphism is essentially an isomorphism  between the orders' underlying sets (invertible function). However, besides their underlying sets, orders also have the arrows that connect them, so there is one more condition: in order for an invertible function to constitute an order isomorphism it has to *respect those arrows*, in other words it should be *order preserving*. More specifically, applying this function (let's call it $F$) to any two elements in one set ($a$ and $b$) should result in two elements that have the same corresponding order in the other set (so $a ≤ b$ if and only if $F(a) ≤ F(b)$). 

That a way to define them, but it is not the best way. Now that we know about functors (which, as we said, serve as functions between the orders and other categories), we can devise a new, simpler definition, which would also be valid for all categories, not just orders, and for all forms of equality (isomorphism and equivalence).

![isomorphic orders](../11_natural_transformations/isomorphic_orders.svg)

We begin with the definition of **set isomorphism**:

> Two **sets** $A$ and $B$ are **isomorphic** (or $A ≅ B$) if there exist functions $f: A \to B$ and its reverse $g: B \to A$, such that $f \circ g = ID_{A}$ and $g \circ f = ID_{A}$.

To amend it so it is valid for all categories  by just replacing the word "function" with "functor" and "set" with "category":

> Two **categories** $A$ and $B$ are **isomorphic** (or $A \cong B$) if there exist *functors* $f: A \to B$ and its reverse $g: B \to A$, such that $f \circ g = ID_{A}$ and $g \circ f = ID_{A}$.

**Task:** Show that the two definitions are equivalent.

Believe it or not, this definition, is just one find-and-replace operation away from the definition of *equivalence*. We get there only by replace equality with isomorphism (so, $=$ with $\cong$). 

> Two **categories** $A$ and $B$ are **equivalent** (or $A \simeq B$) if there exist *functors* $f: A \to B$ and its reverse $g: B \to A$, such that $f \circ g \cong ID_{A}$ and $g \circ f \cong ID_{A}$.

Like we said at the beginning, with isomorphisms, going back and forth brings us to the same object, while with equivalence the object is just *isomorphic* to the original one. This is truly all there is to it. 

There is only one problem, though --- *we never said what it means for functors to be isomorphic*.

Natural transformations, natural isomorphisms and categorical equivalence
===

So, how can we make the above definition "come to life"? The title of this chapter outlines the things we need to define: 

1. *Morphisms between functors* (called *natural transformations*).
2. *Functor isomorphisms* (called *natural isomorphisms*). 
3. Finally *categorical equivalences*.

If this sounds complicated, remember that we are doing the same thing we always did --- talking about isomorphisms. 

In the very first chapter of this book, we introduced *set isomorphisms*, which are quite easy, and now we reached the point to examine *functor isomorphisms*. So, we are doing the same thing. 
<!--comic-->
Although actually...

But actually, natural transformations are quite different from morphisms and functors, (the definition is not "recursive", like the definitions of functor and morphism are). This is because functions and functors are both morphisms between objects (or *1-morphisms*), while natural transformations are *morphisms between morphisms* (known as *2-morphisms*).

But enough talking, let's draw some diagrams. We know that natural transformations are morphisms between functors, so let's draw two functors. 

![Two functors](../11_natural_transformations/natural_functors_objects.svg)

The functors have the same signature. Naturally. How else can there be morphisms between them? 

Now, a functor is comprised of two mappings (object mapping and morphism mapping) so a mapping between functors, would consist of "object mapping mapping" and "morphism mapping mapping" (yes, I often do get in trouble with my choice of terminology, why do you ask?).

Object mapping mapping
---

Let's first connect the object mappings of the two functors, creating what we called "object mapping mapping". 

It is simpler than it sounds when we realize that we only need to connect the object in functors' *target category* --- the objects in the source category would just always be the same for both functors, as both functors would include *all* object from the source category (as that is what functors (and morphisms in general) do). In other words, mapping the two functors' object components involves nothing more than specifying a bunch of morphisms in the target category: one morphism for each object in the source category i.e. each object from the image of the first functor, should have one arrow coming from it (and to an object of the second functor, so, for example, our current source category has two objects and we specify two morphisms.

![Two functors and a natural transformation](../11_natural_transformations/natural_transformation.svg)

Note that this mapping does not map every object from the source category,  i.e. not all objects have arrows coming from them (e.g. here the black and blue square do not have arrows), although, in some cases, it *might*.

**Question:** When exactly would the mapping encompass all objects?

Morphism mapping mapping
---

The morphism part might seem hard... until we realize that, once the connections between the object mappings are already established, there is only one way to connect the morphisms --- we take each morphism of the source category and connect the two morphisms given by the two functors, in the target category. And that's all there is to it. 

![Two functors](../11_natural_transformations/natural_functors.svg)

Oh, actually, there is also this condition that the above diagram should commute (the naturality condition), but that happens pretty much automatically.

The naturality condition
---

Just like anything else in category theory, natural transformations have some laws that they are required to pass. In this case it's one law, typically called the naturality law, or the naturality condition. 

Before we state this law, let's recap where are we now. We have two functors $F$ and $G$ that have the same type signature (so $F : C \to D$ and $G : C \to D$ for some categories $C$ and $D$), and a family of morphisms in the target category $D$ (denoted $\alpha : F \Rightarrow G$) one for each object in $C$, that map each target object of the functor $F$ (or the image of $F$ in $D$ as it is also called) to some target objects of functor $G$. This is a *transformation*, but not necessarily a *natural* one. A transformation is natural, when this diagram commutes for all morphisms in $C$.

![The commuting square of a natural transformation](../11_natural_transformations/natural_transformation_square.svg)

i.e. a transformation is natural when every morphism $f$ in $C$ is mapped to morphisms $F(f)$ by $F$ and to $G(f)$ by $G$ (not very imaginative names, I know), in such a way, that we have $\alpha \circ F(f) = G(f) \circ \alpha$ i.e. when starting from the white square, when going right and then down (via the yellow square) is be equivalent to going down and then right (via the black one).

We may view a natural transformation is a mapping between morphisms and commutative squares: two functors and a natural transformation between two categories means that for each morphism in the source category of the functors, there exist one commutative square at the target category.

![Commuting squares of a natural transformation](../11_natural_transformations/natural_transformation_squares.svg)

When we fully understand this, we realize that commutative squares are made of morphisms too, so, like morphisms, they compose --- for any two morphisms with appropriate type signatures that have we can compose to get a third one, we have two naturality squares which compose the same way.

![Composition of commuting squares of a natural transformation](../11_natural_transformations/natural_transformation_squares_composition.svg)

Which means natural transformation make up a... 

(Oh wait, it's too early for that, is it?)

Natural isomorphisms 
---

After understanding natural transformations, natural isomorphisms, are a no-brainer: a natural transformation is just a family of morphisms in a given category that satisfy certain criteria, then what would a natural *isomorphism* be? That's right --- it is a family of *isomorphisms* that satisfy the same criteria. The diagram is the same as the one for ordinary natural transformation, except that $\alpha$ are not just ordinary morphisms, but isomorphisms.

![Two functors and a natural transformation](../11_natural_transformations/natural_isomorphism.svg)

And the turning those morphisms into isomorphisms makes the diagram commute in more than one way i.e. if we have the naturality condition 

$\alpha \circ F(f) = G(f) \circ \alpha$ i.e. the two paths going from **white** to **blue** are equivalent.

We also have:

$F(f) \circ  \alpha  =   \alpha  \circ G(f)$ i.e. the two paths going from **black** to **yellow** are also equivalent.

Constructing categorical equivalences
---

I am sorry, what were we talking about again? Oh yeah --- categorical equivalence. Remember that categorical equivalence is the reason why we tackle natural transformations and isomorphisms? Or perhaps it was the other way around? Never mind, let's recap what we discussed so far:

1. At the beginning of the section we introduced the notion of equivalence as two functors, such that going from one of them to the other and back again leads you to the same object, or to an *object that is isomorphic* to the one you started with. 

2. And then, we discussed that for categories that are not thin (thick?) the situation is a bit more complex since they can have more than one morphism between two objects, and we should worry not only about isomorphic objects, but about *isomorphic morphisms*. 

Now, we will show how these two notions are formalized by the definition that we presented.

> Two **categories** $A$ and $B$ are **equivalent** (or $A \simeq B$) if there exist *functors* $f: A \to B$ and its reverse $g: B \to A$, such that $f \circ g \cong ID_{A}$ and $g \circ f \cong ID_{A}$.

To understand, this how are the two related, let's construct the identity functor of the category that we have been using as an example all this time. Note that we are drawing the one and the same category two times (as opposed to just drawing an arrow coming from each object to itself), to make the diagrams more readable.

![The identity functor](../11_natural_transformations/equivalent_orders_identity.svg)

Then, we draw the composite of the two functors that establish an equivalence between the two categories, highlighting the 3 "interesting" objects, i.e. the ones due to which the categories aren't isomorphic.

![The composite functor between the two functors that make up the equivalence](equivalent_orders_composite.svg)

Now, we ask ourselves, in which cases does there exist an isomorphism between those two functors?

![An equivalence diagram](../11_natural_transformations/equivalent_orders_functors.svg)

The answer becomes trivial if we draw the isomorphism arrows connecting the three "interesting" objects in a different way (remember, this is the same category on the top and the bottom) --- we can see that these are exactly the arrows that enable us to construct a an isomorphism between the two functors (the others are just identity arrows).

![An equivalence diagram, showing a transformation](../11_natural_transformations/equivalent_orders_transformation.svg)

And when would this isomorphism be such that preserves the structure of the category (so that each morphism from the output of the composite functor has an equivalent one in the output of the identity)? Exactly when the isomorphism is *natural* i.e. when every morphism points to a commuting square -- this ensures not only that no morphism is lost, when applying the composite functor, but that the morphisms in the target of the functor behave in the same way as their counterparts in the source.

![ An equivalence diagram, showing a natural transformation](../11_natural_transformations/equivalent_orders_natural_transformation.svg)

With this, we are finished with categorical equivalence, but not with natural transformations --- natural transformations are a very general concept, and categorical equivalences are only a very narrow case of them.

Natural transformations in programming. Natural transformations on the list functor
===

In the course of this book, we learned that programming/computer science is the study of the category of types in programming languages. However (in order to avoid this being too obvious) in the computer science context, we use different terms for the standard category-theoretic concepts. 

We learned that objects are known as *types*, products and coproducts are, respectively, *objects/tuple* types and *sum* types. And, in the last chapter, we learned that functors are known as *generic types*. Now it's the time to learn what natural transformations are in this context. They are known as *(parametrically) polymorphic functions*.

Pointed functors again
---

Now, suppose this sounds a bit vague. If only we had some example of a natural transformation in programming, that we can use... But wait, we did show a natural transformation, in the previous chapter, when we talked about pointed functors. 

That's right, a functor is pointed when there is a natural transformation between it and the identity functor i.e. to have one green arrow for every object/type.

![Pointed functor](../11_natural_transformations/pointed_functor.svg)

And this clearly is a natural transformation. As a matter of fact, if we get down to the nitty-gritty, we would see that it resembles a lot the equivalence diagram that we saw earlier --- both transformations involve the identity functor, and both transformations have the same category as source and target, that's why we can put everything in one circle (we don't do that in the equivalence diagram, but that's just a matter of presentation). 

Actually, the only difference between the two transformations is that an equivalence is defined by a natural *natural isomorphism* of a given functors to the identity functor ( $ID \cong f \circ g $ and $ID \cong g \circ f$), while a pointed functor is defined by a one-way *natural transformation* from the identity functor ($ID \to f $)  i.e. the equivalence functor is pointed, but not the other way around). 

Polymorphic functions as natural transformations 
---

We said that a natural transformation is equivalent to a (parametrically) polymorphic function in programming. But wait, wasn't natural transformation something else (and much more complicated):

> Two functors $F$ and $G$ that have the same type signature (so $F : C \to D$ and $G : C \to D$ for some categories $C$ and $D$), and a family of morphisms in the target category $D$ (denoted $\alpha : F \Rightarrow G$) one for each object in $C$. Morphisms that map each object of the target of $F$ (or the image of $F$ in $D$ as it is also called) to some object in the target of $G$. 

Indeed it is (I wasn't lying to you, in case you are wondering), however, in the case of programming, the source and target categories of both functors are the same category ($Set$), so the whole condition regarding the functors' type signatures can be dropped. 

> Two ~~functors~~ generic types $F$ and $G$ ~~that have the same type signature~~ and a family of morphisms in $Set$ (denoted $\alpha : Set \Rightarrow Set$) one for each object in $Set$, that map each target object of the functor $F$ (or the image of $F$ in $D$ as it is also called) to some target objects of functor $G$. 

As we know from the last chapter, a functor in programming is a generic type (which, has to have the `map` function with the appropriate signature). 

And what is a "family of morphisms in $Set$ one for each object in $Set$"? Well, the morhpisms in the category $Set$ are functions, so that's just a bunch of functions, one for each type.  In Haskell notation, if we denote a random type by the letter $$a$$), it is $alpha : \forall a. F a \to G a$.  But that's exactly what polymorphic functions are. Here is how would we write the above definition in a more traditional language  (we use capital `<A>` instead of $a$, as customary.

```typescript

function alpha<A>(a: F<A>) : G<A> {
}

```

Generic types work by replacing the `<A>` with some concrete type, like `string`, `int` etc. Specifically, the natural transformation from the identity functor to the list functor that puts each value in a singleton list looks like this $alpha :: \forall\ a. a \to List\ a$. Or in TypeScript:

```typescript

function array<A>(a: <A>) : Array<A> {
    return [a]
}
```

Some examples of natural transformations
---

Once we rid ourselves of the feeling of confusion, that such an excessive amount of new terminology and concepts impose upon us (which can take years, by the way), we realize that there are, of course, many polymorphic functions/natural transformations that programmers use.

For example, in the previous chapter, we discussed one natural transformation/polymorphic function the function $\forall a.a \to [a]$ which puts every value in a singleton list. This function is a natural transformation between the identity functor and the list functor. 

![Natural transformation, defining a pointed functor in Set](../11_natural_transformations/pointed_functor_set_transformation.svg)

This is pretty much the only one that is useful with *this* signature (the others being $a \to [a, a]$, $a \to [a, a, a]$ etc.), but there are many examples with signature $list\ a \to list\ a$, such as the function to *reverse* a list.

![The natural transformation, for reversing a list in Set](../11_natural_transformations/reverse_set_transformation.svg)

...or *take1* that retrieves the first element of a list
 
![The natural transformation, for taking the first element of a list in Set](../11_natural_transformations/take_set_transformation.svg)

or *flatten* a list of lists of things to a regular list of things (the signature of this one is a little different, it's $list\ list\ a \to list\ a$).

![The natural transformation, for flattening a list in Set](../11_natural_transformations/flatten_set_transformation.svg)

**Task:** Using the first naturality square (displayed above) draw the naturality squares for the rest of the natural transformations.

The naturality condition 
---

Before, we said that we shouldn't worry too much about naturality, as it is satisfied every time. Statistically, however, this is not true --- as far as I am concerned, about 99.999 percent of transformations aren't really natural (I wonder if you can compute that percentage properly?). But at the same time, it just so happens (my favourite phrase when writing about maths) that all transformations that we care about *are* natural. 

So, what does the naturality condition entail, in programming? To understand this, we construct some naturality squares of the transformations that we presented.

We choose two types that play the role of $a$, in our case $string$ and $num$ and one natural transformation, like the transformation between the identity functor and the list functor.

![Pointed functor in Set](../11_natural_transformations/pointed_functor_set.svg)

The diagram commute when for all functions $f$, applying the $Ff$, the mapped/lifted version of $f$ with one functor (in our case this is just $ F f : string \to num$ cause it is the identity functor), followed by ($alpha :: F b \to G\ b$), is equivalent to applying ($alpha:: F a \to G\ a$), and then the mapped version of $f$ with the other functor (in our case $G f :: List\ a \to List\ b$) i.e. 

$$\alpha \circ F\ f \cong G\ f \circ \alpha$$

(in the programming world, you would also see it as something like  $\alpha (map\ f x) = map\ f (\alpha x)$, but note that here $map$ function means two different things on the two sides, Haskell is just smart enough to deduce which $fmap$ to use).

And in TypeScript, when we are talking specifically about the identity functor and the list functor, the equality is expressed as:

```
[x].map(f) == [f(x)]
```

So, is this equation true in our case? To verify it, we take one last peak at the world of values.

We acquire an $f$, that is, we a function that acts on simple values (not lists), such as the function $length : string \to num$, which returns the number of characters a string has and convert it, (or *lift* it, as the terminology goes) to a function that acts on more complex values, using the list functor, (and the higher-order function $map$).

![A lifted function](../11_natural_transformations/lifted_function_f.svg)

Then, we take the input and output types for this function (in this case $string$ and $num$), and the two morphisms of a natural transformation (e.g the abstract function $\forall a.a \to [a]$) that correspond to those two types.

![Pointed functor in Set](../11_natural_transformations/pointed_functor_set_transformations.svg)

When we compose these two pairs of morphisms we observe that they indeed commute --- we get two morphisms that are actually one and the same function.

![Pointed functor in Set](../11_natural_transformations/pointed_functor_set_internal.svg)

The above square shows the transformation $\forall a.a \to [a]$ (which is between the identity functor and the list functor, here is another one, this time between the list functor and itself ($\forall a.[a] \to [a]$) --- $reverse$ 

![Pointed functor in Set](../11_natural_transformations/reverse_set_internal.svg)

(and you can see that this would work not just for $length$, but for any other function).

So, why does this happen? Why do these particular transformations make up a commuting square for each and every morphism?

The answer is simple, at least in our specific case: the original, unlifted function $f :: a \to b$ (like our $length :: string \to num$) can only work on the individual values (not with structure), while the natural transformation functions, i.e. ones with signature  $list :: a \to list\ a$ only alter the structure, and not individual values. The naturality condition just says that these two types of functions can be applied in any order that we please, without changing the end result.

This means that if you have a sequence of natural transformations that you want to apply, (such as $reverse$ , $take$, $flatten$ etc) and some lifted functions ($F f$, $F g$), you can mix and match between the two sequences in any way you like and you will get the same result e.g. 

$$take1 \circ reverse \circ F\ f \circ F\ g$$

is the same as 

$$take1 \circ F\ f \circ reverse \circ F\ g$$

...or...

$$ F\ f \circ F\ g \circ take1 \circ reverse$$

...or any other such sequence (the only thing that isn't permitted is to flip the members of the two sequences --- ($take1 \circ reverse$ is of course different from $reverse \circ take1$and if you have $F\ f \circ F\ g$, then $F\ g \circ F\ f$ won't be permitted at all due to the different type signatures).

**Task:** Prove the above results, using the formula of the naturality condition.

Non-natural transformations
---

"Unnatural", or "non-natural" transformations (let's call them just *transformations*) are mentioned so rarely, that we might be inclined to ask if they exist. The answer is "yes and no". Why yes? On one hand, transformations, consist of an innumerable amount of morphisms, forming an ever more innumerable amount of squares and obviously nothing stops some of these squares to be non-commuting. 

For example, if we substitute one morphism from the family of morphisms that make up the natural transformation with some other random morphism that has the same signature, all squares that have this morphism as a component would stop commuting.

![Unnatural transformation](../11_natural_transformations/unnatural_transformation_squares.svg)

This would result in something like an "almost-natural" transformation (e.g. an abstract function that reverses all lists, except lists of integers).

And in the category of sets, where morphisms are functions i.e. mappings between values, it is enough to move just one arrow of just one of those values in order to make the transformation "unnatural" (e.g. a function which reverses all lists, but one specific list).

![Unnatural transformation in set --- like reverse, but one arrow is off](../11_natural_transformations/reverse_set_unnatural.svg)

Finally, if can just gather a bunch of random morphisms, one for each object, that fit the criteria, we get what I would call a "perfectly unnatural transformation" (but this is my terminology).

But, although they do exist, it is very hard to define non-natural transformations. For example, for categories that are *infinite*, there is no way to specify such "perfectly unnatural transformation" (ones where none of the squares commute) without resorting to randomness. And even transformations on finite categories, or the "semi-natural" transformations which we described above (the ones that include a single condition for a single value or type), are not possible to specify in some languages e.g. you can define such a transformation in Typescript, but not in Haskell.

To see why, let's see what the type of a natural transformation is.

$$\forall\ a.\ F a \to G a$$

The key is that the definition should be valid *for all* types a. For this reason, there is no way for us to specify a different arrows for different types, without resorting to type downcasting, which is not permitted in languages like Haskell (as it breaks the principle of parametricity).

<!--
{% if site.distribution == 'print' %}
-->

Interlude: Skolem variables and parametrization
---

Let's try to define the "semi-natural" transformation that we described above (the ones that include a single condition for a single value or type) e.g. an abstract function that reverses all lists, except the list of booleans). In Typescript, it will look something like this.

```typescript
function unnatural<A> (a: Array<A>): Array <A>{
    if(typeof a[0] === 'string') {
        return a
    } else {
        return a.reverse()
    }
}
```

<!--comic-->
(Look at this piece of code! Doesn't this seem "unnatural"?)

This will work, but, if you try to do the same in Haskell, for example, it would immediately tell you that you cannot ("`a` is a "rigid type variable" (also known as "Skolem variable" in other context)). Why is it so?  There are some *technical reasons*, as runtime type checks like this one, add performance overhead, because they require the runtime to preserve type information for each value, after compilation, but there is also a strong *philosophical reason*: a general function should work in a general way. And the generality of a function that checks the type of a value at runtime (and behaves differently for different types) is dubious at best. 

Such function is like, (if we switch to the logic branch of the Curry-Howard isomorphism) proving a general statement, of the form "All $a$'s have a given property" by merely pointing out that the $a$s that are currently in existence happen to have it. Surely, even if valid in some contexts, such proofs are a very limited in terms of both scope and information they carry e.g. the assertion that all people who are sitted at the table next to you have brown hair doesn't tell you anything of substance, unless there is a deeper reason for it to be true.

In other words, unnatural transformations wouldn't work in Haskell, simply because they are ... unnatural i.e. they do not follow the laws.

By the way, in programming, this principle is called "parametricity" and the natural abstract functions are called "parametrically polymorphic", whereas unnatural polymorphic functions are known as ad-hoc polymorphic.

<!--
{%endif%}
-->

Natural transformations again
===

Now, after we saw the definition of natural transformations, it is time to see the definition of natural transformations (and if you feel that the quality of the humour in this book is deteriorating, that's only because *things are getting serious*).

Let's again review the commuting diagram that represents a natural transformation.

![Two functors](../11_natural_transformations/natural_functors.svg)

This diagram might prompt us into viewing natural transformations as some kind of "two-arrow functors" that have not one but two arrows coming from each of their morphisms --- this notion, can be formalized, by using *product categories*. 

Oh wait, I just realized we never covered product categories... but don't worry, we will cover them now.

Product groups and product categories
---

We haven't covered product categories, however some pages ago, when we covered monoids and groups, we talked about the concept of a *product group*. The good news is that product *categories* are a generalization of product *groups*...

The bad news is that you probably don't remember much about product groups , but don't worry, we will do a refresher now:

Given two groups $G$ and $H$, whose sets of elements can also be denoted $G$ and $H$... 

![The Klein four as a product group](../11_natural_transformations/groups_product.svg)

(in this example we use two boolean groups, which we visualize as the groups of horizontal and vertical rotation of a square)

...the *product group* of these two groups is a group that has the cartesian product of these two sets $G \times H$ as its set of elements.

![The Klein four as a product group](../11_natural_transformations/klein_four_underlying_set.svg)

And what can the group operation of such a group be? Well, I would say that out of the the few possible groups operations for this set that *exist*, this is the *only* operation that is *natural* (I didn't intend to involve natural transformation at this section, but they really apper everywhere). So, let's try to derive the operation of this group.

We know what a group operation is, in principle: A group operation combines two elements from the group into a third element i.e. it is a function with the following type signature:

$$\circ :  (A, A) \to A$$

or equivalently

$$\circ :  A \to A \to A$$

And for product groups, we said that the underlying set of the group (which we dubbed $A$ above) is a cartesian product of some other two sets which we dubbed $G$ and $H$. So, when we swap $A$ for $G \times H$ the definition becomes:

$$\circ : G \times H \to G \times H \to G \times H$$

i.e. the group operation takes one pair of elements from $G$ and $H$ and another pair of elements from $G$ and $H$, only to return --- guess what --- a pair of elements $G$ and $H$. 

Let's take an example. To avoid confusion, we take two totally different groups --- the color-mixing group and the group of integers under addition. That would mean that a value of $G \times H$ would be a pair, containing a random color and a random number, and the operation would combine two combine two such pairs and produce another one.

![Equations of the product of numbers and colors](../11_natural_transformations/product_group_equations.svg)

Now, the operation must produce a pair, containing a number and a color. Furthermore, it would be good if it produces a number *by using those two numbers*, not just picking one at random, and likewise for colors. And furthermore, we want it to work not just for monoids of numbers and colors, but all other monoids that can be given to us. It is obvious that there is only one solution, to get the elements of the new pair by combining the elements of the pairs given.

![Solutions of the product of numbers and colors](../11_natural_transformations/product_group_solutions.svg)

And the operation of the product group of the two boolean groups which we presented earlier is the combination of the two operations 

![The Klein four as a product group](../11_natural_transformations/klein_four_as_product.svg)

So, the general definition of the operation is the following ($g1$, $g2$ are elements of $G$ and $h1$ and $h2$ elements of $H$).

$$(g1, h1) \circ (g2, h2) = ( (g1 \circ g2), (g2 \circ h2))$$

And that are product groups.

<!--
{% if site.distribution != 'print' %}
-->

Interlude: Naturality in product group operations
---

Now, we will show that the group operation of product groups is actually a natural transformation. To understand why, let's look at the equations once more.

![Equations of the product of numbers and colors](../11_natural_transformations/product_group_equations.svg)

We said that in order for the solutions for this equations, to make sense, they would have to work for all monoids, not just numbers and colors,in other words, there should be a mechanism that, given two monoids, produces a third one. This mechanism can be nothing more and nothing less of a polymorphic function.

$$\forall G H. G \to H \to G \times H$$

We shown above how polymorphic functions are transformations (this one is harder to reason about, since it is parametrized over not one, but two types, but we learned how to represent functions that take two arguments as functions that take one argument in chapter 2).

We also said that we are interested in solutions which produce a number, somehow by using the two numbers provided, not just picking one at random, and, similarly, ones that produce a new color using the colors given. This condition corresponds to the *naturality condition* which indeed does hold (correct by construction) for all product groups.

<!--
{%endif%}
-->

Product categories
---

we are back at tackling product *categories*. 

We now know what product *groups*, are and we know that groups nothing but categories with just one object (and the group objects are the category's morphisms, remember?), so this should be enough to get us started.

Here is a way to make a product category. Take any two categories. 

![Product category - components](../11_natural_transformations/product_components.svg)

Then take the set of all possible pairs of the objects of these categories.

![Product category - objects](../11_natural_transformations/product_set.svg)

And, finally, we make a category of that set by taking all morphisms coming from any of the two categories and replicate them to all pairs that feature some objects from their type signature.

![Product category](../11_natural_transformations/product_category.svg)

This is the *product category* of the two categories.

Natural transformations as functors of product categories
---

In this section we are interested with the products of one particular category, namely the category we called $2$, containing two objects and one morphism (stylishly represented in black and white).

![The category 2](../11_natural_transformations/category_two.svg)

This category is the key to constructing a functor that is equivalent to a natural transformation --- because it has two objects, it produces two copies of the source category and because the two objects are connected, the two copies are connected in the same way as the two "images" in the target category are connected. 

So, given a product category of $2$ and some other category $C$...

![The category 2](../11_natural_transformations/product_category_target_category.svg)

...there exist a natural transformation between $C$ and the product category $2\times C$.

![Product category](../11_natural_transformations/product_category_natural_transformation.svg)

Furthermore, any natural transformation from $C$ to some other category (call it $D$, as it is customary) can be represented as a functor $2 \times C \to D$.

That is, if we have a natural transformations $\alpha : F \Rightarrow G$ (where  $F: C \to D$ and  $G: C \to D$), then, we also have a functor  $2 \times C \to D$, such that if we take the subcategory of $2 \times C$ comprised of just those objects that have the $0$ object as part of the pair, and the morphisms between them, we get a functor that is equivalent to $F$, and if we consider the subcategory that contains $1$, then the functor is equivalent to $G$ (we write $\alpha(-,0)=F$ and $\alpha(-,1)=G$). Et voilà!

**Task:** Show that the two definitions are equivalent.

This perspective helps us realize that a natural transformation can be viewed as a collection of commuting squares. The source functor defines the left-hand side of each square, the target functor --- the right-hand side, and the transformation morphisms join these two sides.

![Notation for natural transformation](../11_natural_transformations/natural_transformation_notation.svg)

We can even retrieve the structure of the source category of the functors, which (as categories are by definition structure and nothing more) is equivalent to retrieving the category itself.

Composing natural transformations
===

Natural transformations are surely a different beast than normal morphisms and functors and so they don't compose in the same way. However, they do compose and here we will show how.

The identity natural transformation
---

But before this, we have to get this one trivial definition out of the way --- for each functor, we have the identity natural transformation (actually a natural isomorphism) between it and itself.

![The identity natural transformation](../11_natural_transformations/identity_natural_transformation.svg)


Horizontal composition
---

The setup for composing natural transformations is complicated: we need three categories $C$, $D$ and $E$ (just as composition of morphisms requires three objects). We need a total of four functors, distributed on two pairs, one pair of functors that goes from $C$ to $D$ and one that goes from $D$ to $E$ (so we can compose these two pairs of functors together, to get a new pair of functors that go $C \to E$). However, we will try to keep it simple and we will treat the natural transformation as a map from a morphism to a commuting square. As we showed above, this mapping already contains the two functors in itself.

So, let's say that we have the natural transformation $\alpha$ involving the $C \to D$ functors (which we usually call $F$ and $G$).

![Notation for natural transformation](../11_natural_transformations/horizontal_composition_notation.svg)

So, what will happen if we have one more transformation $\bar\alpha$ involving the functors that go $D \to E$ (which are labelled $F'$ and $G'$)? Well, since a natural transformation maps each morphism to a square, and a square contains four morphisms (two projections by the two functors and two components of the transformation), a square would be mapped to four squares.

Let's start by drawing two of them for each projection of the morphism in $C$.

![Horizontal composition of natural transformation](../11_natural_transformations/horizontal_composition_squares.svg)

We have to have two more squares, corresponding to the two morphisms that are the components of the $\alpha$ natural transformation. However, these morphisms connect the objects that are the target of the two functors, objects that we already drew on our diagram, so rather than drawing them again, we just draw the connections between them.

![Horizontal composition of natural transformation](../11_natural_transformations/horizontal_composition.svg)

We see that the result is an interesting structure which is sometimes visualized as a cube.

![Horizontal composition of natural transformation](../11_natural_transformations/horizontal_composition_cube.svg)

More interestingly, the cube contains not one, but two commuting squares (visualized in grey and red) that connect morphisms $F'Ff$ and $G'Gf$ i.e. there is a natural transformation between the composite functor $F' \circ F : C \to E$ and $G' \circ G : C \to E$ --- a natural transformation that is called $\bar\alpha \bullet \alpha$.

**Task:** Find the commuting square on the diagram above.

**Task:** Show that commuting squares compose i.e. that when you stack two commuting squares next to each other you get a new commuting square.

Whiskering
---

And an interesting special case of horizontal composition is horizontal composition involving the identity natural transformation: given a natural transformation $\bar\alpha$ involving functors with signature $D \to E$ and some functor with signature $F : C \to D$, we can take $\alpha$ to be the identity natural transformation between functor $F$ and itself and compose it with $\bar\alpha$. 

![Horizontal composition of natural transformation](../11_natural_transformations/horizontal_composition_whiskering.svg)

We get a new natural transformation $\bar\alpha \bullet \alpha$, that is practically the same as the one we started with ($\bar\alpha$) so what's the deal? We just found a way to *extend* a given natural transformation, using functors.

**Task**: Try to extend the natural transformation in the other direction (by taking $\bar\alpha$ to be identity). 

So, this is how you compose natural transformations. It's too bad that this is form of composition is different from the standard categorical composition. So, I guess natural transformations do not form a category, like we hoped they would...

Well, OK, there is actually another way of composing categories, which might actually work.

Vertical composition
---

For *vertical* composition of natural transformations, we will need three (or more) functors with the same type signature, say $F, G, H: C \to D$ i.e. three functors that have the same source and target category. Then, we need two natural transformations between those functors with the appropriate type signatures e.g. $\alpha: F \to G$ and $\beta: G \to H$. 

![Vertical composition of natural transformations](../11_natural_transformations/vertical_composition.svg)

We can combine each morphism of the natural transformation $\alpha$ (e.g. $a: F \to G$) and the corresponding morphism of the natural transformation $\beta$ (say $b:G \to H$) to get a new morphism $b \circ a : F \to H$. And the set of all such morphisms are precisely the components of a new natural transformation: $\beta \circ \alpha : F \to H$.

Categories of functors
---

Now, we are approaching the end of the chapter, we will introduce our category and call it quits. To do that, we introduce a more compressed notation for vertical composition of natural transformations (where they do indeed look vertical).

We started this chapter by looking at category of sets and using internal diagrams, displaying the set elements as points and the sets/objects as collections. 

![Vertical composition of natural transformations - internal diagram](../11_natural_transformations/vertical_composition_internal.svg)

**Task:** identify the function, the three functors, and the two natural transformations used in this diagram.

<!--
answer
(A little note, if you want to understand the diagram better: $F$ and $G$ are the $List$ functor, $H$ is the $ID$ functor, $\alpha$ is  $reverse: List \to List$ and $\beta$ is $head : List \to ID$ and $f$ is $length : string \to int$)
-->

Then, we quickly passed to normal external diagrams, where objects are points and categories are collections.

![Vertical composition of natural transformations](../11_natural_transformations/vertical_composition.svg)

And now we go one more level further, and show the category of categories, where categories are points and functors are morphisms.

![Vertical composition of natural transformations in Cat](../11_natural_transformations/vertical_composition_cat.svg)

In this notation, we display natural transformations as (double) arrows between morphisms.

![Vertical composition of natural transformations in Cat](../11_natural_transformations/vertical_composition_cat_2.svg)

And you can already see the new category that is formed: For each two objects in the category of categories Cat (like $C$ and $D$ in this case), there exist one category where functors are objects and natural transformations are morphisms. Natural transformations compose with vertical compositions, and, of course, the identity natural transformation is the identity morphism.

![Vertical composition of natural transformations in Cat](../11_natural_transformations/functor_category.svg)

Now, you might be wondering the following: $Cat$ is a category that has, as every other category, morphisms between objects, but it also has *morphisms between morphisms* (which can even compose and form categories). What does that make of it.

Interchange law
---

We've seen two ways to compose natural transformations: vertically (◦), like stacking squares, and horizontally (•), like composing their functors side-by-side. 

Four naturality squares, with an appropriate structure can be composed 

$$(β \circ α) \bullet (\bar β \circ \bar α) = (β \bullet \bar β) \circ (α \bullet \bar α)$$
